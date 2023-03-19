// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




import 'package:folio/src/app_systems/services/dark_mode_service.dart';

import 'package:folio/src/app_systems/services/locale_state_service.dart';
import 'package:folio/src/app_systems/services/router_service.dart';

import 'package:folio/src/app_systems/services/supported_locales_service.dart';

import 'package:folio/src/app_systems/themes/colors/brand_fcs.dart';


/// The Widget that configures your application.
class MyApp extends ConsumerWidget {
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final router = ref.watch(routerServiceProvider);

    final appDarkThemeMode = ref.watch(darkModeServiceProvider);

    final List<Locale> _supportedLocales = ref.read(supportedLocalesServiceProvider);

    // Watch the current locale and rebuild on change
    final Locale _locale = ref.watch(localeStateServiceProvider).locale;

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
