// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally part of the layout library which is under
// MIT License Copyright 2019 by Jaime Blasco

import 'package:flutter/material.dart';
import 'package:folio/src/presentation/widgets/layout_breakpoint.dart';
import 'package:folio/src/presentation/widgets/layout_context.dart';

mixin LayoutValueMixin<T> {
  T resolveForLayout(LayoutContext layout);

  T resolve(BuildContext context) {
    final layout = Layout.of(context);
    
    return resolveForLayout(layout);
  }
}

typedef LayoutValueBuilder<T> = T Function(LayoutContext layout);

/// A responsive value that adapts dynamically to the width of the screen.
///
/// The `valueBuilder` callback returns the responsive value for a given container
/// width.
///
/// ```
/// final isTablet = FluidValue.fromWidth((containerWidth) {
///     return containerWidth >= 600;
/// });
/// ```
///
/// Calculating the responsive values is usually done by this library automatically
/// but it can also be calculated with the following methods:
/// To get the value for a given width screen use the method `resolveForWidth`.
/// If there is a [Layout] inside the widget you can also use `resolveForContext`
/// that will automatically calulate the value for the container width provided by
/// the closest Layout inside the upper widget tree from the `context` referenced
/// provided as param.
///
/// See also:
///   - [BreakpointValue], a value that adapts dinamically to relative width
///     screen breakpoints.
abstract class LayoutValue<T> with LayoutValueMixin<T> {
  static const screenWidth = _ScreenWidthValue();

  factory LayoutValue({
    required T xs,
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) = BreakpointValue<T>;
  factory LayoutValue.builder(LayoutValueBuilder<T> builder) =
      _DefaultLayoutValue<T>;
  factory LayoutValue.value(T value) = ConstantLayoutValue<T>;

  
}

abstract class BaseLayoutValue<T> implements LayoutValue<T> {
  const BaseLayoutValue();

  @override
  T resolve(BuildContext context) {
    final layout = Layout.of(context);

    return resolveForLayout(layout);
  }
}

class _DefaultLayoutValue<T> extends BaseLayoutValue<T> {
  final LayoutValueBuilder<T> builder;
  const _DefaultLayoutValue(this.builder);

  @override
  T resolveForLayout(LayoutContext layout) => builder(layout);
}

/// A responsive value that adapts dynamically dinamically to relative width
/// screen breakpoints
///
/// ```
/// final cellCount = BreakpointValue(xs: 1, s: 2, sm: 4, lg: 20);
/// ```
///
/// This class is not usually used directly and if you are using [Layout],
/// it is recommended to use the `context.layout.value(xs: 1, s: 2, sm: 4, lg: 20);`
/// to get directly the responsive value.
///
/// Calculating the responsive values is usually done by this library automatically
/// but it can also be calculated with the following methods:
/// To get the value for a given breakpoint use the method `resolveForBreakpoint`.
/// If there is a [Layout] inside the widget you can also use `resolve(context)`
/// that will automatically calulate the value for the container width provided by
/// the closest `Layout` inside the upper widget tree from the `context` referenced
/// provided as param.
///
/// See also:
///   - [BreakpointValue], a value that adapts dinamically to relative width
///     screen breakpoints.
class BreakpointValue<T> extends BaseLayoutValue<T> {
  // ignore: prefer-correct-identifier-length
  final T xs;
  // ignore: prefer-correct-identifier-length
  final T? sm;
  // ignore: prefer-correct-identifier-length
  final T? md;
  // ignore: prefer-correct-identifier-length
  final T? lg;
  // ignore: prefer-correct-identifier-length
  final T? xl;

  const BreakpointValue({
    required this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
  });

  const BreakpointValue.all({
    required this.xs,
    required T this.sm,
    required T this.md,
    required T this.lg,
    required T this.xl,
  });

  BreakpointValue.fromMap(Map<LayoutBreakpoint, T> values, [T? defaultValue,])
      : assert(
            values.length == LayoutBreakpoint.values.length ||
                defaultValue != null,
            'A default value is required if there is not a value asigned to a breakpoint inside the map',),
        xs = values[LayoutBreakpoint.xs] ?? defaultValue!,
        sm = values[LayoutBreakpoint.sm],
        md = values[LayoutBreakpoint.md],
        lg = values[LayoutBreakpoint.lg],
        xl = values[LayoutBreakpoint.xl];

  T resolveForBreakpoint(LayoutBreakpoint breakpoint) {
    switch (breakpoint) {
      case LayoutBreakpoint.xs:
        return xs;
      case LayoutBreakpoint.sm:
        return sm ?? xs;
      case LayoutBreakpoint.md:
        return md ?? sm ?? xs;
      case LayoutBreakpoint.lg:
        return lg ?? md ?? sm ?? xs;
      case LayoutBreakpoint.xl:
        return xl ?? lg ?? md ?? sm ?? xs;
    }
  }

  @override
  T resolveForLayout(LayoutContext layout) {
    return resolveForBreakpoint(layout.breakpoint);
  }
}

class ConstantLayoutValue<T> extends BaseLayoutValue<T> {
  final T value;

  const ConstantLayoutValue(this.value);

  @override
  T resolveForLayout(LayoutContext layout) => value;
}

class _ScreenWidthValue extends BaseLayoutValue<double> {
  const _ScreenWidthValue();

  @override
  double resolveForLayout(LayoutContext layout) => layout.width;
}
