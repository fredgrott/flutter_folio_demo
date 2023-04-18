// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:grott_folio/generated/l10n.dart';
import 'package:grott_folio/src/application/routes/app_router.dart';

import 'package:grott_folio/src/presentation/themes/brand_fcs.dart';

// Note: The cross-platform scheme of flutter even with addition of
//       3rd party libraries is imperfect and we often have to modify
//       our crossplatform strategy. For example, Flutter Platform Widgets
//       crossplatform strategy is generally too heavy for a strict
//       web platform only use case. Thus, here I use the adaptive
//       constructors in Flutter SDK crossplatform strategy.
//
//       The widgets that have adaptive constructors are:
//                 Switch
//                 SwitchListTile
//                 CircularProgressIndicator

// scaffoldMessengerKey.currentState?.context
// for the snackbar
// also handy for mocking in unit testing
// ignore: prefer-static-class
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class AppPlatformWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey, 
      // using go router instead of manually implementing router delegates
      routerConfig: appRouter, 
      theme: brandThemeDataLight, 
      darkTheme: brandThemeDataDark, 
      themeMode: ThemeMode.dark, 
      locale: const Locale("en, us"), 
      // for localizations without context via intl utils package
      localizationsDelegates: const [S.delegate], 
      supportedLocales: AppLocalizations.supportedLocales, 
      debugShowCheckedModeBanner: false, 
      restorationScopeId: "Grott Folio",
    );
  }
}
