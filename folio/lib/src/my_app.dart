// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/app_systems/providers/dark_mode_provider.dart';
import 'package:folio/src/app_systems/providers/locale_provider.dart';
import 'package:folio/src/app_systems/providers/supported_locales_provider.dart';
import 'package:folio/src/app_systems/router/router.dart';
import 'package:folio/src/app_systems/themes/colors/app_dark_flex_theme_data.dart';
import 'package:folio/src/app_systems/themes/colors/app_light_flex_theme_data.dart';


/// The Widget that configures your application.
class MyApp extends ConsumerWidget {
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final router = ref.watch(routerProvider);

    final appDarkThemeMode = ref.watch(darkModeProvider);

    final List<Locale> _supportedLocales = ref.read(supportedLocalesProvider);

    // Watch the current locale and rebuild on change
    final Locale _locale = ref.watch(localeProvider);

    return MaterialApp.router(
      routerConfig: router, 
      // if we have dynamic color, that gets supplied to the theme functions as a parameter
      theme: lightMidThemeData, 
      darkTheme: darkMidThemeData, 
      themeMode: appDarkThemeMode ? ThemeMode.dark : ThemeMode.light, 
      locale: _locale, 
      localizationsDelegates: AppLocalizations.localizationsDelegates, 
      supportedLocales: _supportedLocales, 
      debugShowCheckedModeBanner: false, 
      restorationScopeId: "Folio",
    );
  }
}
