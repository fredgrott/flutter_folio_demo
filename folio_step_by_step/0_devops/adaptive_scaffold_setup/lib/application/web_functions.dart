// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:adaptive_scaffold_setup/application/nav_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:url_launcher/url_launcher.dart';

class WebFunctions {
  WebFunctions._();

  static Future<void> appLaunchUrl(String nonParsed) async {
    final Uri siteUrl = Uri.parse(nonParsed);

    if (!await launchUrl(siteUrl)) {
      throw Exception("Could not launch");
    }
  }

  static Size textSize({
    required String text,
    required TextStyle? style,
    int maxLines = 1,
    double maxWidth = double.infinity,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style,
      ),
      textDirection: TextDirection.ltr,
      maxLines: maxLines,
    )..layout(
        minWidth: 0,
        maxWidth: maxWidth,
      );

    return textPainter.size;
  }

  // Set app title for web and desktop platforms as in web and desk
  // we have some extra chrome to set. Actually does work on mobile as well
  // called at top of screen widget as WebFunctions().setTitle("ScreenTitle")
  static Future<void> setTitle([
    String? title,
  ]) async {
    // ignore: prefer-extracting-callbacks
    Future.microtask(() {
      SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
          label: "GrottFolio | ${title ?? 'Design Awesome Brand Stories'}",
          // When using providers this would change to receiving rootNavigatorKey via the Consumer widget
          // on AppScreen and flowing it in that way with no major changes to the functionmethod setTitle.
          // except for a new parameter to get rootNavigatorKey
          primaryColor:
              Theme.of(rootNavigatorKey.currentContext!)
                  .colorScheme
                  .primary
                  .value, // your app primary color
        ),
      );
    });
  }
}
