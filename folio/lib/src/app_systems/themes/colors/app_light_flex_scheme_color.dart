// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:folio/src/app_systems/themes/colors/app_brand_colors.dart';

// ignore: prefer-static-class
final FlexSchemeColor appLightFlexSchemeColor = FlexSchemeColor.from(
  primary: brandPrimary, 
  secondary: brandSecondary, 
  tertiary: brandTertiary, 
  brightness: Brightness.light,
);
