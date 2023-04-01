// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:grott_folio/src/presentation/widgets/app_platform_wrapper.dart';
import 'package:grott_folio/src/presentation/widgets/nav_bar.dart';

// Note: Web platform shared scaffolds tend to be implemented accoding
//       to specific use case of the web site or web app. A strong
//       common pattern to both web sites and web apps is to customize
//       the appbar and drawer together as part of the page or screen
//       wrapper rather than use the scaffold app and drawer slots
//       usually implemented using the stack widget.
//
//       Also keep in mind per widget unit testing page object patterns 
//       the shared scaffold is where have the parent finder of the page object 
//       testing patterns as that finder is grabbing the app screen to base 
//       matchers on.

// For Widget unit test mocking purposes as shared scaffold we usually
// want included in the Widget unit test UI wrapper which means we need
// extra if else block in our init state block that uses business logic
// to set the appScreenIndex for two different init State use cases in which
// one is real app state init and the other is widget unit test Ui wrapper
// init state.
//
// Benefits is that then I do not have to write the shared scaffold twice.
// Do NOT MARK THIS AS FINAL OR CONST
// ignore: prefer-static-class
int appScreenIndex = 0;

class AppSharedScaffold extends StatefulWidget {
  /// The appScreen that the scaffold UI encases.
  final Widget appScreen;

  const AppSharedScaffold({
    super.key,
    required this.appScreen,
  });

  @override
  State<AppSharedScaffold> createState() => _AppSharedScaffoldState();
}

class _AppSharedScaffoldState extends State<AppSharedScaffold> {
  bool isRTL() =>
      Directionality.of(context).toString().contains(TextDirection.rtl.name);

  void onIndexSelect(int newIndex) {
    setState(() {
      // set the global to the passed int indicating appScreenIndex nav to
      appScreenIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // as of late March 2023 this is hardwired in adaptive scaffold so have to od
      // custom where we set it dynamically
      textDirection: isRTL() ? TextDirection.rtl : TextDirection.ltr,

      // Common to Web Apps and Web Sites we do not use the appBar and drawer scaffold slots
      // but rather that gets implement as part of Stack widget of the screen wrapper.
      // Other UX mod is to use Flutter Adaptive Scaffold package as then it
      // keeps the website spanning 2 screens on android devices with fold.
      child: Scaffold(
        key: scaffoldMessengerKey,
        // on web we do not have add SafeArea when the appbar of scaffold is null unlike mobile without 
        // both appbar in scaffold and no SliverAppBAr
        body: AdaptiveLayout(
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig?>{
              Breakpoints.standard: SlotLayout.from(
                key: const Key("ScreenContent"),
                builder: (_) {
                  return Stack(
                    children: [
                      widget.appScreen,
                      NavBar(),
                    ],
                  );
                },
              ),
            },
          ),
          bodyRatio: 1.0,
          bodyOrientation: Axis.horizontal,
        ),
        ),
        
        
      
    );
  }

  // initialize the locale
  @override
  void initState() {
    super.initState();

    // no need to initialize localization here as using intl utils package
    // gen to use localization via no context instead

   
  }
}

class NavigationArguments {
  bool showUnVeilPageAnimation;
  bool reverseAnimationOnPop;

  NavigationArguments({
    this.showUnVeilPageAnimation = true,
    this.reverseAnimationOnPop = true,
  });
}
