// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:folio/src/app_systems/themes/app_base_colors.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

/// Set up a Flex Color Scheme assuming that we may or not have a
/// dynamic color source color input. If dynamic color source color present use MCU
/// Blend.hamronize function to shift hue of design color.
///
/// @author Fredrick Allan Grott.
// ignore: prefer-static-class
FlexSchemeColor appFlexSchemeColorLight(Color sourceColor) {
  final basePrimary = Blend.harmonize(
    AppBaseColors().basePrimary.value,
    sourceColor.value,
  );
  final basePrimaryContainer = Blend.harmonize(
    AppBaseColors().basePrimaryContainer.value,
    sourceColor.value,
  );
  final baseSecondary = Blend.harmonize(
    AppBaseColors().baseSecondary.value,
    sourceColor.value,
  );
  final baseSecondaryContainer = Blend.harmonize(
    AppBaseColors().baseSecondaryContainer.value,
    sourceColor.value,
  );
  final baseTertiary = Blend.harmonize(
    AppBaseColors().baseTertiary.value,
    sourceColor.value,
  );
  final baseTertiaryContainer = Blend.harmonize(
    AppBaseColors().baseTertiaryContainer.value,
    sourceColor.value,
  );
  final baseAppBarColor = Blend.harmonize(
    AppBaseColors().baseAppBar.value,
    sourceColor.value,
  );
  final baseError = Blend.harmonize(
    AppBaseColors().baseError.value, sourceColor.value,);

  return FlexSchemeColor(
    primary: Color(basePrimary), 
    primaryContainer: Color(basePrimaryContainer), 
    secondary: Color(baseSecondary), 
    secondaryContainer: Color(baseSecondaryContainer), 
    tertiary: Color(baseTertiary), 
    tertiaryContainer: Color(baseTertiaryContainer), 
    appBarColor: Color(baseAppBarColor), 
    error: Color(baseError),
  );
}
