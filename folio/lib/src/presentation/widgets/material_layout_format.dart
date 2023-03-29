// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally part of the layout library which is under
// MIT License Copyright 2019 by Jaime Blasco

import 'package:folio/src/presentation/widgets/layout_breakpoint.dart';
import 'package:folio/src/presentation/widgets/layout_format.dart';
import 'package:folio/src/presentation/widgets/layout_value_mixin.dart';

class MaterialLayoutFormat extends LayoutFormat {
  @override
  final LayoutValue<double> gutter;

  @override
  final LayoutValue<double> margin;

  @override
  final Map<LayoutBreakpoint, double> breakpoints = {
    LayoutBreakpoint.xs: 0,
    LayoutBreakpoint.sm: 600,
    LayoutBreakpoint.md: 1024,
    LayoutBreakpoint.lg: 1440,
    LayoutBreakpoint.xl: 1920,
  };

  @override
  final LayoutValue<double> maxWidth = BreakpointValue.all(
    xs: 600,
    sm: 540,
    md: 720,
    lg: 960,
    xl: 1140,
  );


  @override
  final LayoutValue<int> columns = LayoutValue.builder(
    (layout) {
      final width = layout.width;
      if (width <= 599) {
        return 4;
      } else if (width <= 839) {
        return 8;
      } else {
        return 12;
      }
    },
  );

  static final LayoutValue<double> _defaultMargin = LayoutValue.builder(
    (layout) {
      return layout.width <= 719 ? 16 : 24;
    },
  );

  


  MaterialLayoutFormat({
    LayoutValue<double>? margin,
    LayoutValue<double>? gutter,
  })  : this.margin = margin ?? _defaultMargin,
        this.gutter = gutter ?? _defaultMargin;

}
