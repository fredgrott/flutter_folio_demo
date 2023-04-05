// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {

  final String title;
  final TextStyle? titleStyle;
  final Color titleColor;
  final double? fontSize;


  const AppLogo({
    super.key, 
    this.title = "GROTT",
    this.titleColor = Colors.white,
    this.titleStyle,
    // ignore: no-magic-number
    this.fontSize = 60,

  });




  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Text(
      title,
      style: titleStyle ??
          textTheme.headlineMedium?.copyWith(
            color: titleColor,
            fontSize: fontSize,
          ),
    );

  }
  
}
