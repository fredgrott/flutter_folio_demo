// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally part of the layout library which is under
// MIT License Copyright 2019 by Jaime Blasco

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:folio/src/presentation/widgets/layout_breakpoint.dart';
import 'package:folio/src/presentation/widgets/layout_context.dart';
import 'package:folio/src/presentation/widgets/layout_value_mixin.dart';

abstract class LayoutFormat {
  /// A breakpoint is the range of predetermined screen sizes that have specific
  /// layout requirements. At a given breakpoint range, the layout adjusts
  /// to suit the screen size and orientation.
  Map<LayoutBreakpoint, double> breakpoints = const {};

  /// Content is placed in the areas of the screen that contain columns.
  /// Column width is defined using percentages, rather than fixed values,
  /// to allow content to flexibly adapt to any screen size.
  /// The number of columns displayed in the grid is determined by the
  /// breakpoint range (a range of predetermined screen sizes) at which a screen is viewed,
  /// whether itâ€™s a breakpoint for mobile, tablet, or another size.
  LayoutValue<int> columns = const ConstantLayoutValue(12);

  ///  Gutters are the spaces between columns. They help separate content.
  ///  Gutter widths are fixed values at each breakpoint range.
  /// To better adapt to the screen, gutter width can change at different breakpoints.
  /// Wider gutters are more appropriate for larger screens, as they create more whitespace between columns.
  LayoutValue<double> gutter = const ConstantLayoutValue(0);

  /// Margins are the space between content and the left and right edges of the screen.
  /// Margin widths are defined as fixed values at each breakpoint range.
  /// To better adapt to the screen, the margin width can change at different breakpoints.
  /// Wider margins are more appropriate for larger screens, as they create more whitespace around the perimeter of content.
  LayoutValue<double> margin = const ConstantLayoutValue(0);

  /// Max width allow in FixedWidth widget.
  final LayoutValue<double> maxWidth = LayoutValue.screenWidth;

  LayoutFormat();

  VisualDensity visualDensity(BuildContext context) {
    return Theme.of(context).visualDensity;
  }

  LayoutData resolve(
    Size layoutSize,
    MediaQueryData mediaQuery,
    VisualDensity visualDensity,
  ) {
    final width = layoutSize.width;
    final context = LayoutContext(
      size: layoutSize,
      breakpoint: breakpointForWidth(layoutSize.width),
      devicePixelRatio: mediaQuery.devicePixelRatio,
      visualDensity: visualDensity,
    );
    final double maxWidth = min(
      width,
      this.maxWidth.resolveForLayout(
            context,
          ),
    );
    final double spacing = gutter.resolveForLayout(context);
    final double margin = this.margin.resolveForLayout(context);
    final int columns = this.columns.resolveForLayout(context);

    return LayoutData(
      size: layoutSize,
      devicePixelRatio: context.devicePixelRatio,
      visualDensity: visualDensity,
      margin: margin,
      format: this,
      gutter: spacing,
      breakpoint: context.breakpoint,
      columns: columns,
      maxWidth: maxWidth,
    );
  }

  @protected
  LayoutBreakpoint breakpointForWidth(double width) {
    // Iterate all breakpoints from biggest to smallest
    for (final breakpoint in LayoutBreakpoint.values.reversed) {
      if (breakpoints[breakpoint] != null &&
          width >= breakpoints[breakpoint]!) {
        return breakpoint;
      }
    }

    return LayoutBreakpoint.xs;
  }
}
