// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally part of the layout library which is under
// MIT License Copyright 2019 by Jaime Blasco


// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:folio/src/presentation/widgets/layout_context.dart';

/// A widget that adds a padding to its child. This
/// padding is calculated by `Layout` and can be overrided
/// by the margin param
///
/// See also:
///  - [SliverMargin] An equivalent to be used inside CustomScrollView.
class Margin extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;

  const Margin({
    super.key,
    required this.child,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding(
        layout: context.layout, 
        margin: margin,
      ), 
      child: child,
    );
  }

  static EdgeInsets _padding({
    required LayoutData layout,
    bool fluid = false,
    EdgeInsets? margin,
    double? maxWidth,
  }) {
    EdgeInsets padding =
        margin ?? EdgeInsets.symmetric(horizontal: layout.margin);
    if (fluid) {
      if (maxWidth != null) {
        final fluidMargin = (layout.size.width - maxWidth) / 2;
        padding += EdgeInsets.symmetric(horizontal: fluidMargin);
      } else {
        padding += EdgeInsets.symmetric(horizontal: layout.fluidMargin);
      }
    }

    return padding;
  }
}

/// A widget that adds a padding to its sliver child. This
/// padding is calculated by `Layout` and can be overrided
/// by the margin param
///
/// See also:
///  - [Margin] An equivalent to be used outside CustomScrollView.
// ignore: prefer-single-widget-per-file
class SliverMargin extends SingleChildRenderObjectWidget {
  final EdgeInsets? margin;

  const SliverMargin({
    super.key,
    required Widget sliver,
    this.margin,
  }) : super(child: sliver);

  @override
  RenderSliverPadding createRenderObject(BuildContext context) {
    final EdgeInsets padding = Margin._padding(
      layout: context.layout,
      margin: margin,
    );

    return RenderSliverPadding(
      padding: padding,
      textDirection: Directionality.of(context),
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderSliverPadding renderObject,) {
    final EdgeInsets padding = Margin._padding(
      layout: context.layout,
      fluid: false,
      margin: margin,
    );

    renderObject
      ..padding = padding
      ..textDirection = Directionality.of(context);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

/// A widget that adds a fluid padding to its child. This padding has the goal
/// to constrain the child to a given max width according to the screen size
///
/// This padding is calculated by [Layout]. It also containes the relative
/// margin provided by the [Margin] widget and this can be overrided
/// with the margin param.
///
/// See also:
///  - [SliverFluidMargin] An equitvalent to be used inside CustomScrollView.
// ignore: prefer-single-widget-per-file
class FluidMargin extends StatelessWidget {
  final Widget child;
  final bool fluid;
  final double? maxWidth;
  final EdgeInsets? margin;

  const FluidMargin({
    super.key,
    required this.child,
    this.margin,
    this.fluid = true,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Margin._padding(
        layout: context.layout, 
        fluid: fluid, 
        margin: margin, 
        maxWidth: maxWidth,
      ), 
      child: child,
    );
  }
}

/// Equivalent of [FluidMargin] for sliver widgets.
// ignore: prefer-single-widget-per-file
class SliverFluidMargin extends SingleChildRenderObjectWidget {
  final double? maxWidth;
  final EdgeInsets? margin;
  final bool fluid;

  const SliverFluidMargin({
    super.key,
    required Widget sliver,
    this.margin,
    this.fluid = true,
    this.maxWidth,
  }) : super(child: sliver);

  @override
  RenderSliverPadding createRenderObject(BuildContext context) {
    final EdgeInsets padding = Margin._padding(
      layout: context.layout,
      fluid: fluid,
      margin: margin,
      maxWidth: maxWidth,
    );

    return RenderSliverPadding(
      padding: padding,
      textDirection: Directionality.of(context),
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderSliverPadding renderObject,) {
    final EdgeInsets padding = Margin._padding(
      layout: context.layout,
      fluid: fluid,
      margin: margin,
      maxWidth: maxWidth,
    );

    renderObject
      ..padding = padding
      ..textDirection = Directionality.of(context);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}

// ignore: prefer-single-widget-per-file
class SliverFluidBox extends StatelessWidget {
  final Widget? child;
  final double? maxWidth;
  final EdgeInsets? margin;
  final bool fluid;

  const SliverFluidBox({
    super.key,
    this.child,
    this.margin,
    this.fluid = true,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFluidMargin(
      sliver: SliverToBoxAdapter(
        child: child,
      ), 
      margin: margin, 
      fluid: fluid, 
      maxWidth: maxWidth,
    );
  }
}
