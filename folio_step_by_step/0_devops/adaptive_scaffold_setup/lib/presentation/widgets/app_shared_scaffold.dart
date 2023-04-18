// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:adaptive_scaffold_setup/presentation/widgets/custom_app_bar.dart';

import 'package:adaptive_scaffold_setup/presentation/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

/// AppShatedScaffold will often mirror part of the adaptive scaffold from
/// the Flutter Adaptive Scaffold package, see source
/// https://github.com/flutter/packages/blob/main/packages/flutter_adaptive_scaffold/lib/src/adaptive_scaffold.dart
///
/// Generally, the rail and bottom nav are built as builder constructs in the head of statefull and rest including
/// scaffold and any constrating body content wrappers in the state part.
///
/// Constrained Centered Layout stuff is from Ryd Mike's blog post here
/// https://rydmike.com/blog_layout_and_theming
/// The DartPad for it is at
/// https://dartpad.dev/?id=f2f45a57d4998f3c61d3fa197b5a7370&null_safety=true
///
/// @author Fredrick Allan Grott.
class AppSharedScaffold extends StatefulWidget {
  final Breakpoint drawerBreakpoint;

  final Widget child;

  const AppSharedScaffold({
    super.key,
    this.drawerBreakpoint = Breakpoints.small, required this.child,
  });

  @override
  State<AppSharedScaffold> createState() => _AppSharedScaffoldState();
}

class _AppSharedScaffoldState extends State<AppSharedScaffold> {
  @override
  Widget build(BuildContext context) {
    // Flutter Adatpive Scaffold adaptive scaffold hardwires TextDirection.ltr
    bool isRTL() => Directionality.of(context)
        .toString()
        .contains(TextDirection.rtl.toString());

    return Directionality(
      textDirection: isRTL() ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: AdaptiveLayout(
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig?>{
              Breakpoints.standard: SlotLayout.from(
                key: const Key('body'),
                inAnimation: AdaptiveScaffold.fadeIn,
                outAnimation: AdaptiveScaffold.fadeOut,
                builder: (_) => widget.child,
              ),
            },
          ),
          bodyRatio: 1.0,
          internalAnimations: true,
          bodyOrientation: Axis.horizontal,
        ),
        drawer:
            widget.drawerBreakpoint.isActive(context) ? CustomDrawer() : null,
      ),
    );
  }
}
