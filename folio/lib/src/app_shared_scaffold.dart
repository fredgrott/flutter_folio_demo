// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/custom_app_bar.dart';

import 'package:folio/src/domain/models/locale_state_model.dart';
import 'package:folio/src/presentation/widgets/layout_breakpoint.dart';
import 'package:folio/src/presentation/widgets/layout_context.dart';

/// An adaptive scaffold pattern for the Web platform based on the layout
/// library package example, see
/// https://github.com/jamesblasco/layout/blob/main/example/lib/example.dart
/// 
/// Parameter testIndex is set to zero in app use case and in the 
/// Widget test wrapper use case is set to appropriate index value of 
/// app screen being tested.
///
/// @author Fredrick Allan Grott.
class AppSharedScaffold extends ConsumerStatefulWidget {
  final Widget child;

  final int testIndex;

  const AppSharedScaffold(
    this.child,
    this.testIndex,
  );

  @override
  ConsumerState<AppSharedScaffold> createState() => _AppSharedScaffoldState();
}

class _AppSharedScaffoldState extends ConsumerState<AppSharedScaffold> {
  late int index;

  void onIndexSelect(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    // set so that drawer displayed on mobile
    final alwaysDisplayStartDrawerMobile =
        context.layout.breakpoint <= LayoutBreakpoint.md;

    // set so app bar displays horz menu on desktop
    final alwaysDisplayHorzMenuDesk =
        context.layout.breakpoint >= LayoutBreakpoint.lg;

    // alternative way to do adaptive scaffold, its default is material design
    // settings for gutters, margins, etc. Layout is an inherited widget
    // setup to deliver breakpoints, etc.
    return Layout(
      child: Scaffold(
        appBar: CustomAppBar(
          displayDesktMenu: alwaysDisplayHorzMenuDesk,
          selectedIndex: index,
          onIndexSelect: onIndexSelect,
        ),
        drawer: alwaysDisplayStartDrawerMobile ? null : Drawer(),
      ),
    );
  }

  // initialize the locale
  @override
  void initState() {
    super.initState();

    index = widget.testIndex;

    final widgetsBinding = WidgetsBinding.instance;
    if (widgetsBinding != null) {
      widgetsBinding.addPostFrameCallback((_) async {
        // Locale Startup Actions
        ref.read(localeStateModelProvider.notifier).initLocale();
      });
    }
  }
}
