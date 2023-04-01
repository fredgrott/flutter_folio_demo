// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:flutter/material.dart';

class AppFunctions {

  AppFunctions._();

  static Future<void> launchUrl(String url) async {
    await launchUrl(url);
  }

  static Size textSize({
    required String text,
    required TextStyle? style,
    int maxLines = 1,
    double maxWidth = double.infinity,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style,), textDirection: TextDirection.ltr, maxLines: maxLines)
      ..layout(minWidth: 0, maxWidth: maxWidth,);

    return textPainter.size;
  }




  
}
