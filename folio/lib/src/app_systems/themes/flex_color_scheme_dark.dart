// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:folio/src/app_systems/themes/app_flex_key_colors.dart';
import 'package:folio/src/app_systems/themes/app_flex_scheme_color_dark.dart';

import 'package:folio/src/app_systems/themes/content_color_theme.dart';
import 'package:folio/src/app_systems/themes/custom_flex_tones.dart';
import 'package:folio/src/app_systems/themes/text_theme_light.dart';

// ignore: prefer-static-class
FlexColorScheme flexColorSchemeDark(Color source) {
  return FlexColorScheme.dark(

    colors: appFlexSchemeColorDark(source),

    usedColors: 6,

    surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,

    blendLevel: 0,

    appBarStyle: FlexAppBarStyle.background,

    appBarOpacity: 0,

    transparentStatusBar: true,

    appBarElevation: 0,

    bottomAppBarElevation: null,

    tabBarStyle: FlexTabBarStyle.flutterDefault,

    surfaceTint: null,

    darkIsTrueBlack: true,

    swapColors: false,

    tooltipsMatchBackground: false,

    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
    ),

    keyColors: appFlexKeysColors,

    useMaterial3ErrorColors: false,

    tones: customLightFlexTones,

    visualDensity: FlexColorScheme.comfortablePlatformDensity,

    /// Text with a color that contrasts with the card and canvas colors.
    textTheme: textThemeLight(source),

    /// A text theme that contrasts with the primary color.
    primaryTextTheme: textThemeLight(source), 

    typography: Typography.material2021(),

    applyElevationOverlayColor: true,

    useMaterial3: true,

    swapLegacyOnMaterial3: true, 

    extensions: <ThemeExtension<dynamic>>{
      ContentColorTheme.harmonized(
        source,
        Brightness.dark,
      ),
    },
  );
}
