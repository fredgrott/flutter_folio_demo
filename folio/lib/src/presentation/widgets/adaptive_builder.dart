// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally part of the layout library which is under
// MIT License Copyright 2019 by Jaime Blasco


import 'package:flutter/material.dart';
import 'package:folio/src/presentation/widgets/layout_context.dart';
import 'package:folio/src/presentation/widgets/layout_value_mixin.dart';

typedef LayoutWidgetBuilder = Widget Function(
  BuildContext context,
  LayoutContext layout,
  Widget? child,
);

class AdaptiveBuilder extends StatelessWidget {
  final LayoutValue<WidgetBuilder> child;

  AdaptiveBuilder({
    super.key,
    required WidgetBuilder xs,
    WidgetBuilder? sm,
    WidgetBuilder? md,
    WidgetBuilder? lg,
    WidgetBuilder? xl,
  })  : child = BreakpointValue(xs: xs, sm: sm, md: md, lg: lg, xl: xl,);

  AdaptiveBuilder.builder({
    super.key,
    required LayoutWidgetBuilder builder,
    Widget? child,
  })  : child = LayoutValue.builder((layoutContext) {
          return (context) => builder(context, layoutContext, child,);
        });

  const AdaptiveBuilder.raw({super.key, required this.child,});

  @override
  Widget build(BuildContext context) {
    return context.layout.resolve(child)(context);
  }
}
