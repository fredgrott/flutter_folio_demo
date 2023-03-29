// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values, avoid_final_parameters

import 'dart:math' as math;

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// ignore: prefer-static-class
const Color brandPrimary = Color(0xff620e16);

// ignore: prefer-static-class
const Color brandSecondary = Color(0xff7a2f04);

// ignore: prefer-static-class
const Color brandTertiary = Color(0xffdd7e51);

// ignore: prefer-static-class
final FlexSchemeColor brandFCSColorsLight = FlexSchemeColor.from(
  primary: brandPrimary,
  secondary: brandSecondary,
  tertiary: brandTertiary,
  brightness: Brightness.light,
);

// ignore: prefer-static-class
final FlexSchemeColor brandFCSColorsDark = FlexSchemeColor.from(
  primary: brandPrimary,
  secondary: brandSecondary,
  tertiary: brandTertiary,
  brightness: Brightness.dark,
);

// ignore: prefer-static-class
const FlexKeyColors brandKeyColors = FlexKeyColors(
  // has to match how many seed colors I supply and how
  // many HCT generated color role colors I want to keep
  useKeyColors: true,
  useSecondary: true,
  useTertiary: true,
  keepPrimary: false,
  keepSecondary: false,
  keepTertiary: false,
  keepPrimaryContainer: true,
  keepSecondaryContainer: true,
  keepTertiaryContainer: true,
);

// ignore: prefer-static-class
const FlexTones brandTonesLight = FlexTones.light(
  primaryTone: 30,
  onPrimaryTone: 98,
  onSecondaryTone: 98,
  onTertiaryTone: 98,
  onErrorTone: 98,
  backgroundTone: 95,
  surfaceTone: 98,
  onSurfaceVariantTone: 20,
  inverseSurfaceTone: 30,
  surfaceTintTone: 30,
  primaryMinChroma: 50,
  neutralChroma: 5,
  neutralVariantChroma: 10,
);

// ignore: prefer-static-class
const FlexTones brandTonesDark = FlexTones.dark(
  onPrimaryTone: 10,
  primaryContainerTone: 20,
  onSecondaryTone: 10,
  onTertiaryTone: 10,
  backgroundTone: 20,
  onSurfaceVariantTone: 95,
  inverseSurfaceTone: 95,
  primaryMinChroma: 50,
  neutralChroma: 5,
  neutralVariantChroma: 10,
);

/// Borrowed from Flex Seed Scheme and  is a re-implementation of
/// TinyColor algo. This way I do not have to do extra colors
/// via theme extensions which makes it easier.
///
extension BrandFlexColorAdjExt on Color {
  /// Brightens the color with the given integer percentage amount.
  /// Defaults to 10%.
  Color brighten([final int amount = 10]) {
    if (amount <= 0) return this;
    if (amount > 100) return Colors.white;

    return Color.fromARGB(
      alpha,
      math.max(
        0,
        math.min(
          255,
          red - (255 * -(amount / 100)).round(),
        ),
      ),
      math.max(
        0,
        math.min(
          255,
          green - (255 * -(amount / 100)).round(),
        ),
      ),
      math.max(
        0,
        math.min(
          255,
          blue - (255 * -(amount / 100)).round(),
        ),
      ),
    );
  }

  /// Lightens the color with the given integer percentage amount.
  /// Defaults to 10%.
  Color lighten([final int amount = 10]) {
    if (amount <= 0) return this;
    if (amount > 100) return Colors.white;
    // HSLColor returns saturation 1 for black, we want 0 instead to be able
    // lighten black color up along the grey scale from black.
    // ignore: prefer-correct-identifier-length
    final HSLColor hsl = this == const Color(0xFF000000)
        ? HSLColor.fromColor(this).withSaturation(0)
        : HSLColor.fromColor(this);

    return hsl
        .withLightness(math.min(
          1,
          math.max(
            0,
            hsl.lightness + amount / 100,
          ),
        ))
        .toColor();
  }

  /// Darkens the color with the given integer percentage amount.
  /// Defaults to 10%.
  Color darken([final int amount = 10]) {
    if (amount <= 0) return this;
    if (amount > 100) return Colors.black;
    // ignore: prefer-correct-identifier-length
    final HSLColor hsl = HSLColor.fromColor(this);

    return hsl
        .withLightness(math.min(
          1,
          math.max(
            0,
            hsl.lightness - amount / 100,
          ),
        ))
        .toColor();
  }
}
