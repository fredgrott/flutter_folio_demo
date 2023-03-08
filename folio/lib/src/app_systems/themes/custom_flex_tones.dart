// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flex_color_scheme/flex_color_scheme.dart';


// ignore: prefer-static-class
const FlexTones customLightFlexTones = FlexTones.light(
  primaryTone: 30, // Default is 40.
  onPrimaryTone: 95, // Default is 100
  onSecondaryTone: 95, // Default is 100
  onTertiaryTone: 95, // Default is 100
  onErrorTone: 95, // Default is 100
  primaryMinChroma: 55, // Default is 48
  secondaryChroma: 25, // Default is 16
  tertiaryChroma: 40, // Default is 24
  neutralChroma: 7, // Default is 4,
  neutralVariantChroma: 14, // Default is 8
);

// ignore: prefer-static-class
const FlexTones customDarkFlexTones = FlexTones.dark(
  primaryTone: 70, // Default is 80.
  onPrimaryTone: 10, // Default is 20
  onSecondaryTone: 10, // Default is 20
  onTertiaryTone: 10, // Default is 20
  onErrorTone: 10, // Default is 20
  primaryMinChroma: 55, // Default is 48
  secondaryChroma: 25, // Default is 16
  tertiaryChroma: 40, // Default is 24
  neutralChroma: 7, // Default is 4,
  neutralVariantChroma: 14, // Default is 8
);
