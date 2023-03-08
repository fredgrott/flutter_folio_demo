// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// AppBaseColors as in UX Design we set our design colors in light mode and
/// use the Flex Color Scheme to adjust and deliver both the light color scheme and
/// the dark color scheme.
///
/// @author Fredrick Allan Grott.
class AppBaseColors {
  Color basePrimary = const Color(0xff620e16);
  Color basePrimaryContainer = const Color(0xfff77f7f);
  Color baseSecondary = const Color(0xff7a2f04);
  Color baseSecondaryContainer = const Color(0xffdd7e51);
  Color baseTertiary = const Color(0xffaca1a1);
  Color baseTertiaryContainer = const Color(0xffddcfcf);
  Color baseAppBar = const Color(0xffdd7e51);
  Color baseError = const Color(0xffb00020);
  
  // for theme extension for extra colors as light and dark is dynamically
  // delivered based on Brightness
  Color baseExtraOneLight = const Color(0xFFb86914);
  Color baseExtraTwoLight = const Color(0xFFf2c18c);
  Color baseExtraThreeLight = const Color(0xFFcf7617);
  Color baseExtraOneDark = const Color(0xFFeda85e);
  Color baseExtraTwoDark = const Color(0xFFb86914);
  Color baseExtraThreeDark = const Color(0xFFf2c18c);
}
