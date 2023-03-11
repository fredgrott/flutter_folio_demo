// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';


// Gist: Dynamic Color Works by a ColorScheme extension
//       harmonize method to shift hue and chroma of the
//       Dynmaic Color source Color Scheme's semantic
//       error colors with the second step always
//       inserting the design brand colors back into
//       the dynamic color supplied color scheme via
//       copyWith.
//
//       Thus Need ot use the full FlexColorScheme stuff to
//       take up to three color inputs to generate full design
//       powered Flex Color Scheme stuff than use the toScheme
//       method to get an intermediate color scheme to have
//       brand colors to insert into dynamic color color scheme
//       via copyWith.
//
//       I then have to take the same set up and use the toTheme
//       method and generate a theme from the FCS stuff.
//
//       Also part of best practices is that brand design colors
//       are always assumed in light mode but used for both light
//       and dark themes.

// ignore: prefer-static-class
const Color brandPrimary = Color(0xff620e16);

// ignore: prefer-static-class
const Color brandSecondary = Color(0xff7a2f04);

// ignore: prefer-static-class
const Color brandTertiary = Color(0xffdd7e51);

// ignore: prefer-static-class
const Color brandVariantPrimaryLight = Color(0xFFb86914);


// ignore: prefer-static-class
const Color brandVariantSecondaryLight = Color(0xFFf2c18c);


// ignore: prefer-static-class
const Color brandVariantTertiaryLight = Color(0xFFcf7617);

// ignore: prefer-static-class
const Color brandVariantPrimaryDark = Color(0xFFeda85e);

// ignore: prefer-static-class
const Color brandVariantSecondaryDark = Color(0xFFb86914);

// ignore: prefer-static-class
const Color brandVariantTertiaryDark = Color(0xFFf2c18c);
