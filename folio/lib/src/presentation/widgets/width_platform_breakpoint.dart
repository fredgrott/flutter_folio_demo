// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally in the Flutter Adaptive Scaffold package
// Copyright 2013 The Flutter Authors. All rights reserved.

import 'package:flutter/material.dart';
import 'package:folio/src/presentation/widgets/app_breakpoint.dart';

// ignore: prefer-static-class
const Set<TargetPlatform> desktop = <TargetPlatform>{
  TargetPlatform.linux,
  TargetPlatform.macOS,
  TargetPlatform.windows,
};

// ignore: prefer-static-class
const Set<TargetPlatform> mobile = <TargetPlatform>{
  TargetPlatform.android,
  TargetPlatform.fuchsia,
  TargetPlatform.iOS,
};


/// Under Web we still have an OS platform in addition to
/// it being inside the web browser. Use cases can be:
/// ```
///  static const AppBreakpoint small = WidthPlatformBreakpoint(begin: 0, end: 600);
///  static const AppBreakpoint smallAndUp = WidthPlatformBreakpoint(begin: 0);
/// static const AppBreakpoint smallDesktop = WidthPlatformBreakpoint(begin: 0, end: 600, platform: desktop);
/// ```
class WidthPlatformBreakpoint extends AppBreakpoint {
  /// The beginning width dp value. If left null then the [Breakpoint] will have
  /// no lower bound.
  final double? begin;

  /// The end width dp value. If left null then the [Breakpoint] will have no
  /// upper bound.
  // ignore: prefer-correct-identifier-length
  final double? end;

  /// A Set of [TargetPlatform]s that the [Breakpoint] will be active on. If
  /// left null then it will be active on all platforms.
  final Set<TargetPlatform>? platform;

  /// Returns a const [Breakpoint] with the given constraints.
  const WidthPlatformBreakpoint({
    this.begin,
    this.end,
    this.platform,
  });

  @override
  bool isActive(BuildContext context) {
    final TargetPlatform host = Theme.of(context).platform;
    final bool isRightPlatform = platform?.contains(host) ?? true;

    // Null boundaries are unbounded, assign the max/min of their associated
    // direction on a number line.
    final double width = MediaQuery.of(context).size.width;
    final double lowerBound = begin ?? double.negativeInfinity;
    final double upperBound = end ?? double.infinity;

    return width >= lowerBound && width < upperBound && isRightPlatform;
  }
}
