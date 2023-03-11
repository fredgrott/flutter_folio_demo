// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:folio/src/app_systems/themes/colors/app_brand_colors.dart';

@immutable
class ExtraColorsThemeExt extends ThemeExtension<ExtraColorsThemeExt> {
  final Color? quaternary;
  final Color? quinary;
  final Color? senary;

  const ExtraColorsThemeExt({
    required this.quaternary,
    required this.quinary,
    required this.senary,
  });

  @override
  ThemeExtension<ExtraColorsThemeExt> copyWith({
    Color? quaternary,
    Color? quinary,
    Color? senary,
  }) {
    return ExtraColorsThemeExt(
      quaternary: quaternary ?? this.quaternary,
      quinary: quinary ?? this.quinary,
      senary: senary ?? this.senary,
    );
  }

  @override
  ThemeExtension<ExtraColorsThemeExt> lerp(
    covariant ThemeExtension<ExtraColorsThemeExt>? other,
    double t,
  ) {
    if (other is! ExtraColorsThemeExt) {
      return this;
    }

    return ExtraColorsThemeExt(
      quaternary: Color.lerp(
        quaternary,
        other.quaternary,
        t,
      ),
      quinary: Color.lerp(
        quinary,
        other.quinary,
        t,
      ),
      senary: Color.lerp(
        senary,
        other.senary,
        t,
      ),
    );
  }

  ThemeExtension<ExtraColorsThemeExt> harmonizeExtraColors(
      ColorScheme dynamic,) {
    return copyWith(
      quaternary: quaternary!.harmonizeWith(dynamic.primary),
      quinary: quinary!.harmonizeWith(dynamic.primary),
      senary: senary!.harmonizeWith(dynamic.primary),
    );
  }
}

// ignore: prefer-static-class
const ThemeExtension<dynamic> lightExtraColors = ExtraColorsThemeExt(
    quaternary: brandVariantPrimaryLight,
    quinary: brandVariantSecondaryLight,
    senary: brandVariantTertiaryLight,);

// ignore: prefer-static-class
const ThemeExtension<dynamic> darkExtraColors = ExtraColorsThemeExt(
  quaternary: brandVariantPrimaryDark,
  quinary: brandVariantSecondaryDark,
  senary: brandVariantTertiaryDark,
);
