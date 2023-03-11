// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:flex_color_scheme/flex_color_scheme.dart';

/// FlexKeyColors is to configure the colors parameter of
/// FlexColorScheme empowered CS and theme generation and 
/// only works for the 3 colors as seeds way of generating
/// color schemes using the Flex Color Scheme package.
/// 
/// See Flex Color Scheme's FlexThemeData extension and 
/// FlexSchemeColor for details.
/// 
/// @author Fredrick Allan Grott.
// ignore: prefer-static-class
const FlexKeyColors appFlexKeyColors = FlexKeyColors(
  
  useKeyColors: true,
  useSecondary: true,
  useTertiary: true,
  keepPrimary: true,
  keepSecondary: false,
  keepTertiary: false,
  keepPrimaryContainer: false,
  keepSecondaryContainer: false,
  keepTertiaryContainer: false,
);
