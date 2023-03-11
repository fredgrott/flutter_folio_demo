// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore: prefer-static-class
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:folio/src/app_systems/themes/colors/app_flex_key_colors.dart';

import 'package:folio/src/app_systems/themes/colors/extra_colors_theme_ext.dart';

import 'package:folio/src/app_systems/themes/text_theme_dark.dart';

// ignore: prefer-static-class
final FlexColorScheme appDarkFlexColorScheme = FlexColorScheme.dark(
  colors: appDarkFlexColorScheme as FlexSchemeColor,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  appBarStyle: FlexAppBarStyle.background,
  darkIsTrueBlack: true,
  // you override sub themes (component themes) here
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
  ),
  // this is the companion to the colors parameter entry
  // needed for FCS Color Scheme generation
  keyColors: appFlexKeyColors,
  // This is the color palette variation which is needed for every FCS Color Scheme generation method
  tones: FlexTones.jolly(Brightness.dark),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: textThemeDark(),
  primaryTextTheme: textThemeDark(),
  // when using dynamic color cross platform this get's moved to
  // MyApp declaration and haromonized with dynamic color and re inserted into ThemeData
  // via ThemeData.coopyWith()
  extensions: const [darkExtraColors],
);

// ignore: prefer-static-class
final ColorScheme darkMidColorScheme = appDarkFlexColorScheme.toScheme;

// ignore: prefer-static-class
final ThemeData darkMidThemeData = appDarkFlexColorScheme.toTheme;
