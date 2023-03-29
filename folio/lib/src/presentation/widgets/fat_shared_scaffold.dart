// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/domain/models/locale_state_model.dart';
import 'package:folio/src/presentation/widgets/app_breakpoint.dart';
import 'package:folio/src/presentation/widgets/width_platform_breakpoint.dart';

//  Material Design 3 Evolution Notes:
//
//  0. Currently Support for design systems is incomplete with only
//          Material Design via ThemeData and MaterialApp
//          Cupertino Design via CupertinonThemeData and CupertinoApp with the addition
//           of being able to theme all material widgets in Cupertino Design Theme
//
//      MS Windows Fluent is via this package:
//      https://pub.dev/packages/fluent_ui
//
//  1. Adaptive Constructors Differences between Material and Cupertino
//  Widgets with Adaptive constructors for differences between material widgets
//       and cupertino widgets are:
//               Switch
//
//        Google is working through some more to add, see this issue:
//        https://github.com/flutter/flutter/issues/94821
//        It appears next to be added is single selection and multi-selection
//
//   2. I have choosen the do 2nd screen adaptation at the screen layout levelt using
//      this package:  https://pub.dev/packages/multi_screen_layout
//
//   3. For Dynamic color I still grab the user color but instead blend my gen CS in the non primary
//      roles to maintain brand color consitency, generally blending only tertiary. The package to
//      grab user color is:  https://pub.dev/packages/dynamic_color
//
//   4. Flutter SDK now imports Material Color Utilities package for HCT color space implementation
//      https://pub.dev/packages/material_color_utilities
//      Since I instead use Flex Color Scheme to gen ThemeData and ColorSchemes need to keep track and
//      re-implement Flex Color Scheme wise

// ignore: prefer-static-class
const AppBreakpoint largeAndUp = WidthPlatformBreakpoint(begin:840);

class FatSharedScaffold extends ConsumerStatefulWidget {
  final Widget child;
  final int screenIndex;

  const FatSharedScaffold({
    super.key,
    required this.screenIndex,
    required this.child,
  });

  @override
  ConsumerState<FatSharedScaffold> createState() => _FatSharedScaffoldState();
}

class _FatSharedScaffoldState extends ConsumerState<FatSharedScaffold> {

  // nned two bools one isDrawer isHorzMenu



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
    // wrap in Directionality so that we get scrolling and text dir in menus right
    return Directionality(
      textDirection: isRTL() ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(

          actions: [],

        ),
      ),
    );
  }

  // initialize the locale
  @override
  void initState() {
    super.initState();

    index = widget.screenIndex;

    final widgetsBinding = WidgetsBinding.instance;
    if (widgetsBinding != null) {
      widgetsBinding.addPostFrameCallback((_) async {
        // Locale Startup Actions
        ref.read(localeStateModelProvider.notifier).initLocale();
      });
    }
  }
}
