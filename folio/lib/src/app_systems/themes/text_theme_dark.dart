// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: prefer-static-class
// ignore: long-method
// ignore: prefer-static-class
TextTheme textThemeDark(Color shadowColorSource) {
  const letterSpacing2 = 0.5;
  const double fontSize2 = 11;
  const fontSize3 = 12.0;
  const fontSize4 = 14.0;
  const fontSize5 = 12.0;
  const fontSize6 = 14.0;
  const fontSize7 = 16.0;
  const fontSize8 = 14.0;
  const fontSize9 = 16.0;
  const double fontSize10 = 22;
  const fontSize11 = 24.0;
  const double fontSize12 = 28;
  const fontSize13 = 32.0;
  const double fontSize14 = 36;
  const double fontSize15 = 45;
  const double fontSize16 = 57;

  return TextTheme(
    displayLarge: TextStyle(
      fontSize: fontSize16,
      shadows: [Shadow(color: shadowColorSource)],
      fontFamily: GoogleFonts.nunito().fontFamily,
    ),
    displayMedium: TextStyle(
      fontSize: fontSize15, // Same as M3, defaults to 60 in Material2018 Typography.
      shadows: [Shadow(color: shadowColorSource)],
      fontFamily: GoogleFonts.nunito().fontFamily,
    ),
    displaySmall: TextStyle(
      fontSize: fontSize14, // Same as M3, defaults to 48 in Material2018 Typography.
      shadows: [Shadow(color: shadowColorSource)],
      fontFamily: GoogleFonts.nunito().fontFamily,
    ),
    headlineLarge: TextStyle(
      fontSize: fontSize13,
      shadows: [Shadow(color: shadowColorSource)],
      fontFamily: GoogleFonts.nunito().fontFamily,
    ),
    headlineMedium: TextStyle(
      fontSize: fontSize12, // Same as M3, defaults to 34 in Material2018 Typography.
      shadows: [Shadow(color: shadowColorSource)],
      fontFamily: GoogleFonts.nunito().fontFamily,
    ),
    headlineSmall: TextStyle(
      fontSize: fontSize11,
      shadows: [Shadow(color: shadowColorSource)],
      fontFamily: GoogleFonts.nunito().fontFamily,
    ),
    titleLarge: TextStyle(
      fontSize: fontSize10,
      shadows: [Shadow(color: shadowColorSource)],
      fontFamily: GoogleFonts.nunito().fontFamily,
    ),
    titleMedium: TextStyle(
      fontSize: fontSize9,
      shadows: [Shadow(color: shadowColorSource)],
      fontFamily: GoogleFonts.nunito().fontFamily,
    ),
    titleSmall: TextStyle(
      fontSize: fontSize8,
      shadows: [Shadow(color: shadowColorSource)],
      fontFamily: GoogleFonts.nunito().fontFamily,
    ),
    bodyLarge: TextStyle(
      fontSize: fontSize7,
      shadows: [Shadow(color: shadowColorSource)],
      fontFamily: GoogleFonts.nunitoSans().fontFamily,
    ),
    bodyMedium: TextStyle(
      fontSize: fontSize6,
      shadows: [Shadow(color: shadowColorSource)],
      fontFamily: GoogleFonts.nunitoSans().fontFamily,
    ),
    bodySmall: TextStyle(
      fontSize: fontSize5,
      shadows: [Shadow(color: shadowColorSource)],
      fontFamily: GoogleFonts.nunitoSans().fontFamily,
    ),
    labelLarge: TextStyle(
      fontSize: fontSize4,
      shadows: [Shadow(color: shadowColorSource)],
      fontFamily: GoogleFonts.nunitoSans().fontFamily,
    ),
    labelMedium: TextStyle(
      fontSize: fontSize3,
      shadows: [Shadow(color: shadowColorSource)],
      fontFamily: GoogleFonts.nunitoSans().fontFamily,
    ),
    // I chose this, I later saw it happened to match new M3 style too - cool!
    labelSmall: TextStyle(
      fontSize: fontSize2, // Defaults to 10 in Material2018 Typography.
      letterSpacing: letterSpacing2, // Defaults to 1.5 in Material2018 Typography.
      shadows: [Shadow(color: shadowColorSource)],
      fontFamily: GoogleFonts.nunitoSans().fontFamily,
    ),
  );
}
