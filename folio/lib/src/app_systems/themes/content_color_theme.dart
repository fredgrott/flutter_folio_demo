// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:folio/src/app_systems/themes/app_base_colors.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

/// A [ThemeExtension] for content highlight color properties.
class ContentColorTheme extends ThemeExtension<ContentColorTheme> {
  final Color? baseColor;
  final Color? commentColor;
  final Color? keywordColor;
  
  /// Code view theme colors for light mode.
  static final ContentColorTheme light = ContentColorTheme(
    baseColor: AppBaseColors().baseExtraOneLight,
    commentColor: AppBaseColors().baseExtraTwoLight,
    keywordColor: AppBaseColors().baseExtraThreeLight,
    
  );

  /// Code view theme colors for dark mode.
  static final ContentColorTheme dark = ContentColorTheme(
    baseColor: AppBaseColors().baseExtraOneDark,
    commentColor: AppBaseColors().baseExtraTwoDark,
    keywordColor: AppBaseColors().baseExtraThreeDark,
    
  );

  ContentColorTheme({
    this.baseColor,
    this.commentColor,
    this.keywordColor,
    
  });

  /// A harmonized code view color theme, based on [brightness] where colors
  /// are harmonized towards a given [sourceColor].
  factory ContentColorTheme.harmonized(
    Color sourceColor,
    Brightness brightness,
  ) {
    final int sourceColorValue = sourceColor.value;

    // Use the code theme for target brightness.
    final ContentColorTheme contentColorTheme =
        brightness == Brightness.light ? light : dark;

    return ContentColorTheme(
      baseColor: Color(
        Blend.harmonize(
          // As used used in this app we could bang the color, instead of using
          // a fallback, but this is safer generally.
          contentColorTheme.baseColor!.value,
          sourceColorValue,
        ),
      ),
      commentColor: Color(
        Blend.harmonize(
          contentColorTheme.commentColor!.value,
          sourceColorValue,
        ),
      ),
      keywordColor: Color(
        Blend.harmonize(
          contentColorTheme.keywordColor!.value,
          sourceColorValue,
        ),
      ),
      
    );
  }

  @override
  // ignore: long-parameter-list
  ThemeExtension<ContentColorTheme> copyWith({
    Color? baseColor,
    Color? commentColor,
    Color? keywordColor,
    Color? stringColor,
    Color? punctuationColor,
    Color? constantColor,
  }) =>
      ContentColorTheme(
        baseColor: baseColor ?? this.baseColor,
        commentColor: commentColor ?? this.commentColor,
        keywordColor: keywordColor ?? this.keywordColor,
        
      );

  @override
  ThemeExtension<ContentColorTheme> lerp(
    covariant ThemeExtension<ContentColorTheme>? other,
    double t,
  ) {
    if (other is! ContentColorTheme) {
      return this;
    }

    return ContentColorTheme(
      baseColor: Color.lerp(baseColor, other.baseColor, t,),
      commentColor: Color.lerp(commentColor, other.commentColor, t,),
      keywordColor: Color.lerp(keywordColor, other.keywordColor, t,),
      
    );
  }

  

  
}
