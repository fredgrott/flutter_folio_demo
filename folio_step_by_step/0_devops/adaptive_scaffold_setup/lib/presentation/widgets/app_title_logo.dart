// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class AppTitleLogo extends StatelessWidget {
  final String? title;
  final TextStyle? textStyle;
  final double? fontSize;

  const AppTitleLogo({
    super.key,
    this.title = "FG",
    this.textStyle,
    this.fontSize = 60,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Text(
      title!,
      style: textStyle ?? textTheme.headlineLarge?.copyWith(
        color: colorScheme.primary,
        fontSize: fontSize,
      ),
    );
  }
}
