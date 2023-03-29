// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally part of the layout library which is under
// MIT License Copyright 2019 by Jaime Blasco


// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:folio/src/presentation/widgets/layout_breakpoint.dart';
import 'package:folio/src/presentation/widgets/layout_format.dart';
import 'package:folio/src/presentation/widgets/layout_value_mixin.dart';
import 'package:folio/src/presentation/widgets/material_layout_format.dart';

class LayoutContext {
  final LayoutBreakpoint breakpoint;
  final double devicePixelRatio;
  final VisualDensity visualDensity;


  final Size size;
  double get width => size.width;

  

  LayoutContext({
    required this.size,
    required this.breakpoint,
    required this.devicePixelRatio,
    VisualDensity? visualDensity,
  }) : this.visualDensity =
            visualDensity ?? VisualDensity.adaptivePlatformDensity;
}

/// A widget that generates the responsive layout data for its children.
///
/// It calculates a [LayoutData] according to the max width of this widget and
/// the `format` definded.
///
/// This layout `format` is [MaterialFormat] by default, but it is possible to
/// use [BoostrapFormat] or build your own [LayoutFormat]
/// that defines how the layout should behave for different width sizes.
///
/// This [LayoutData] it is accesible from any widget down the tree through
/// `Layout.of(context)` or `context.layout`
///
/// To generate responsive values for different sizes, use the following method
/// `context.layout.value(xs: 1, s:2, m: 3, l:4, xl:5)`
///
/// See also:
///   - [Margin] A widget that adds a responsive padding to its child. This
///     padding is calculated by `Layout`.
class Layout extends StatefulWidget {
  const Layout({
    super.key,
    required this.child,
    this.format,
  });

  final Widget child;

  final LayoutFormat? format;

  static LayoutData of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_LayoutInheritedWidget>()!
      .data;

  static LayoutData? maybeOf(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<_LayoutInheritedWidget>()
      ?.data;

  @override
  _LayoutState createState() => _LayoutState();
}

class LayoutData extends LayoutContext {
  /// Breakpoint screen size for the given context.
  @override
  final LayoutBreakpoint breakpoint;

  /// Layout format that defines the properties for the given context.
  final LayoutFormat format;

  /// Spacing value between items. For example, space between cells in a grid.
  final double gutter;

  /// Padding between the edge of the screens and the content.
  final double margin;

  /// Number of columns in a grid layout for the given context.
  final int columns;

  /// Responsive margin to constraint the content to a max width.
  final double fluidMargin;

  /// Constrained width for the content inside fluid layouts.
  final double maxWidth;

  /// Total margin based on the relative margin and the fluid margin.
  double get fullMargin => fluidMargin + margin;

  /// Total margin based on the relative margin and the fluid margin.
  EdgeInsets get horizontalMargin =>
      EdgeInsets.symmetric(horizontal: fullMargin);

  @override
  double get width => size.width;
  double get height => size.height;


  LayoutData({
    
    required super.size,
    required super.devicePixelRatio,
    required VisualDensity super.visualDensity,
    required this.margin,
    required this.format,
    required this.gutter,
    required this.breakpoint,
    required this.columns,
    required this.maxWidth,
  })  : fluidMargin = (size.width - maxWidth) / 2,
        super(
          breakpoint: breakpoint,
        );

  

  // ignore: long-parameter-list
  T value<T>({required T xs, T? sm, T? md, T? lg, T? xl,}) {
    return LayoutValue(xs: xs, sm: sm, md: md, lg: lg, xl: xl,)
        .resolveForLayout(this);
  }

  T resolve<T>(LayoutValue<T> value) {
    return value.resolveForLayout(this);
  }

  
}

class _LayoutState extends State<Layout> {
  // ignore: prefer-correct-identifier-length
  final Key _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final LayoutFormat format = widget.format ?? MaterialLayoutFormat();

    return LayoutBuilder(
      builder: (context, constraints,) {
        final Size size = constraints.biggest;

        final MediaQueryData mediaQuery = MediaQuery.maybeOf(context) ??
            MediaQueryData.fromView(
              WidgetsBinding.instance.window,
            );
        final visualDensity = format.visualDensity(context);
        final LayoutData data = format.resolve(size, mediaQuery, visualDensity,);

        return _LayoutInheritedWidget(
          key: _key, 
          data: data, 
          child: widget.child,
        );
      },
    );
  }
}

class _LayoutInheritedWidget extends InheritedWidget {
  final LayoutData data;

  const _LayoutInheritedWidget({
    super.key,
    required this.data,
    required super.child,
  });

  @override
  bool updateShouldNotify(_LayoutInheritedWidget oldWidget) {
    return oldWidget.data.size != data.size;
  }
}

extension LayoutBuildContext on BuildContext {
  LayoutData get layout => Layout.of(this);
  LayoutBreakpoint get breakpoint => Layout.of(this).breakpoint;
}
