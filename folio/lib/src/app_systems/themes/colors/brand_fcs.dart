// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:folio/src/app_systems/themes/colors/brand_color_configurations.dart';
import 'package:folio/src/app_systems/themes/colors/brand_sub_themes_data.dart';
import 'package:folio/src/app_systems/themes/text_theme_dark.dart';
import 'package:folio/src/app_systems/themes/text_theme_light.dart';

// Note: I prefer to take the dynamic color user generated color scheme input
//       and blend with non-brand import color roles such as Tertiary background 
//       and surface as that matches the color improvements that the 
//       FCS package offers.
//
//       Thus, it is blending the right colors in the CS and then taken that 
//       intermediatary and inserting it into ThemeData via copyWith.

// ignore: prefer-static-class
final FlexColorScheme brandFCSLight = FlexColorScheme.light(
  colors: brandFCSColorsLight,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  appBarStyle: FlexAppBarStyle.background,
  // sets light surfaces to white on light node
  lightIsWhite: true,
  subThemesData: brandSubThemesDataLight,
  keyColors: brandKeyColors,
  tones: brandTonesLight,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  // Setting main text theme, primary text theme, and typography
  textTheme: textThemeLight(),
  primaryTextTheme: textThemeLight(),
  typography: Typography.material2021(),
);

// ignore: prefer-static-class
final ThemeData brandThemeDataLight = brandFCSLight.toTheme;

// ignore: prefer-static-class
final ColorScheme brandCSLight = brandFCSLight.toScheme;

// ignore: prefer-static-class
final FlexColorScheme brandFCSDark = FlexColorScheme.dark(
  colors: brandFCSColorsDark,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  appBarStyle: FlexAppBarStyle.background,
  // sets light surfaces to white on light node
  darkIsTrueBlack: true,
  subThemesData: brandSubThemesDataDark,
  // this is the companion to the colors parameter entry
  // needed for FCS Color Scheme generation
  keyColors: brandKeyColors,
  // This is the color palette variation which is needed for every FCS Color Scheme generation method
  tones: brandTonesDark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  // Setting main text theme, primary text theme, and typography
  textTheme: textThemeDark(),
  primaryTextTheme: textThemeDark(),
  typography: Typography.material2021(),
);

// ignore: prefer-static-class
final ThemeData brandThemeDataDark = brandFCSDark.toTheme;

// ignore: prefer-static-class
final ColorScheme brandCSDark = brandFCSDark.toScheme;
