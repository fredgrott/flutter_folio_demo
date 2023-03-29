// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/domain/models/locale_state_model.dart';

/// This is meshing two things together, a custom adaptive scaffold
/// and a constrained centered content.
class AppSharedScaffold extends ConsumerStatefulWidget {
  /// A selectedScreen gets provided in the Widget Unit Testing wrapper use case but
  /// in the ShellRoute case is set to zero as its initialized for the home screen
  /// being route 0.
  final int? selectedScreen;

  /// A childScreen is provided in both the app and the widget unit testing
  /// use cases.
  final Widget childScreen;

  const AppSharedScaffold({
    this.selectedScreen = 0,
    required this.childScreen,
  });

  @override
  ConsumerState<AppSharedScaffold> createState() => _AppSharedScaffoldState();
}

class _AppSharedScaffoldState extends ConsumerState<AppSharedScaffold> {
  bool isRTL() =>
      Directionality.of(context).toString().contains(TextDirection.rtl.name);
  
  late int index;

  void onIndexSelect(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // as of late March 2023 this is hardwired in adaptive scaffold so have to od
      // custom where we set it dynamically
      textDirection: isRTL() ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        // need to use non-platform so that the TV use case gets covered
        // as web does not show up as an OS platform and TV willl show up as mobile
        appBar: Breakpoints.mediumAndUp.isActive(context) ? AppBar() : AppBar(),
        body: AdaptiveLayout(
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig?>{
              Breakpoints.standard: SlotLayout.from(
                key: const Key("ScreenContent"),
                builder: (_) => widget.childScreen,
              ),
            },
          ),
          // 1.0 means everything on body and nothing on secondBody
          bodyRatio: 1.0,
          bodyOrientation: Axis.horizontal,
        ),
        drawer: Breakpoints.mediumAndUp.isActive(context) ? null : const Drawer(),
      ),
    );
  }

  // initialize the locale
  @override
  void initState() {
    super.initState();

    index = widget.selectedScreen!;

    final widgetsBinding = WidgetsBinding.instance;
    if (widgetsBinding != null) {
      widgetsBinding.addPostFrameCallback((_) async {
        // Locale Startup Actions
        ref.read(localeStateModelProvider.notifier).initLocale();
      });
    }
  }
}
