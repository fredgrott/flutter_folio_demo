// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally part of the layout library which is under
// MIT License Copyright 2019 by Jaime Blasco


enum LayoutBreakpoint {
  // ignore: prefer-correct-identifier-length
  xs, // Extra Small Screens
  // ignore: prefer-correct-identifier-length
  sm, // Small Screen
  // ignore: prefer-correct-identifier-length
  md, // Small Screen
  // ignore: prefer-correct-identifier-length
  lg, // Medium Screens
  // ignore: prefer-correct-identifier-length
  xl, // Medium Screens
}

extension LayoutBreakpointExtension on LayoutBreakpoint {
  LayoutBreakpoint? get smaller {
    return {
      LayoutBreakpoint.xs: null,
      LayoutBreakpoint.sm: LayoutBreakpoint.xs,
      LayoutBreakpoint.md: LayoutBreakpoint.sm,
      LayoutBreakpoint.lg: LayoutBreakpoint.md,
      LayoutBreakpoint.xl: LayoutBreakpoint.lg,
    }[this];
  }

  LayoutBreakpoint? get bigger {
    return {
      LayoutBreakpoint.xs: LayoutBreakpoint.sm,
      LayoutBreakpoint.sm: LayoutBreakpoint.md,
      LayoutBreakpoint.md: LayoutBreakpoint.lg,
      LayoutBreakpoint.lg: LayoutBreakpoint.xl,
      LayoutBreakpoint.xl: null,
    }[this];
  }

  bool get isXs => LayoutBreakpoint.xs == this;

  // ignore: prefer-correct-identifier-length
  bool get isS => LayoutBreakpoint.sm == this;

  // ignore: prefer-correct-identifier-length
  bool get isM => LayoutBreakpoint.md == this;

  // ignore: prefer-correct-identifier-length
  bool get isL => LayoutBreakpoint.lg == this;

  bool get isXl => LayoutBreakpoint.xl == this;

  bool operator <(LayoutBreakpoint breakpoint) => index < breakpoint.index;
  bool operator >(LayoutBreakpoint breakpoint) => index > breakpoint.index;
  bool operator <=(LayoutBreakpoint breakpoint) =>
      index <= breakpoint.index;
  bool operator >=(LayoutBreakpoint breakpoint) =>
      index >= breakpoint.index;
}
