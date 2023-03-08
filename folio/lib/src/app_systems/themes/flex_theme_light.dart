// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:folio/src/app_systems/themes/flex_color_scheme_light.dart';

/// This function calls [flexColorSchemeDark] and uses
/// [FlexColorScheme.toTheme] to return the [ThemeData] object represented by
/// the returned [FlexColorScheme] setup.
///
/// We do it this way and not directly, or by setting it all up with the
/// convenience extension helper [FlexThemeData.dark], because when we create
/// a standard Flutter SDK theme with [ThemeData.from] a [ColorScheme] factory,
/// we will use the same [flexColorSchemeDark] dark function to return
/// the [ColorScheme] it represents with its [FlexColorScheme.toScheme] method.
///
/// The [ThemeData.from] a [ColorScheme] will be used to demonstrate difference
/// using the exact same [ColorScheme], but using just default [ThemeData] with
/// no [FlexColorScheme] theming applied.
///
// ignore: prefer-static-class
ThemeData flexThemeLight(Color? dynamicColorSourceInput) {
  Color? inputColor;

  // this works as black has a zero hue so the underlying shift of hue is
  // essentially zero if no dynamic color input is available
  inputColor = dynamicColorSourceInput != null ? Colors.black : dynamicColorSourceInput;

  return flexColorSchemeLight(inputColor!).toTheme;
}
