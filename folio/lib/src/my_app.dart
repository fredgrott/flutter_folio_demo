// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/app_systems/services/router_service.dart';
import 'package:folio/src/app_systems/services/supported_locales_service.dart';
import 'package:folio/src/domain/models/dark_mode_model.dart';
import 'package:folio/src/domain/models/locale_state_model.dart';
import 'package:folio/src/presentation/themes/brand_fcs.dart';

/// The Widget that configures the application using the
/// ConsumerWidget to listen to providers.
///
/// @author Fredrick Allan Grott.
class MyApp extends ConsumerWidget {
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final router = ref.watch(routerServiceProvider);

    final appDarkThemeMode = ref.watch(darkModeModelProvider);

    final List<Locale> _supportedLocales =
        ref.read(supportedLocalesServiceProvider);

    // Watch the current locale and rebuild on change
    final Locale _locale = ref.watch(localeStateModelProvider).locale;

    // Creates the MaterialApp widget via router instead of navigator.
    // It calls the WidgetApp.router constructor which under the State build
    // method does an else if usesRouterWithConfig and sets a parent
    // Router<Object>.withConfig() widget object that then is injected
    // into a builder method with a context.
    // See WidgetApp
    // https://github.com/flutter/flutter/blob/90c64ed42ba53a52d18f0cb3b17666c8662ed2a0/packages/flutter/lib/src/widgets/app.dart
    // See Router Widget
    // https://github.com/flutter/flutter/blob/90c64ed42b/packages/flutter/lib/src/widgets/router.dart
    return MaterialApp.router(
      routerConfig: router,
      // if we have dynamic color, that gets supplied to the theme functions as a parameter
      theme: brandThemeDataLight,
      darkTheme: brandThemeDataDark,
      themeMode: appDarkThemeMode ? ThemeMode.dark : ThemeMode.light,
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: _supportedLocales,
      debugShowCheckedModeBanner: false,
      restorationScopeId: "Folio",
    );
  }
}
