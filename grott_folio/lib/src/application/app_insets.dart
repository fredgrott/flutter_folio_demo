// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originala part of Flex Color Scheme web app and examples
// copyright 2021 by Mike Rydstrom MIT Licsense
// See github gist:
// https://gist.github.com/rydmike/f2f45a57d4998f3c61d3fa197b5a7370
// And blog article at:
// https://rydmike.com/blog_layout_and_theming

import 'package:flutter/material.dart';

/// AppInsets at my Material Design 3 best guess as
/// Doc says margins of 16, 24, 24 as far as margins
/// and difference between MD2 and MD3 is that there is
/// no gutter definitions for MD3 like in MD2.
///
/// See this doc for MD3 margins
/// https://m3.material.io/foundations/layout/understanding-layout/spacing
///
/// Also note, it's not spacing as that is a amount between panes as in
/// Android fold and is always 24dp no matter the screen size. And Padding is
/// somewhat different as it increments by 4dp each time.
///
/// @author Fredrick Allan Grott.
class AppInsets {
   // Margins
  // ignore: prefer-correct-identifier-length
  static const double cp = 16;
  // MD3 spec has 24 which is somewhat wrong as of end of 
  // March 2023.
  // ignore: prefer-correct-identifier-length
  static const double md = 20;
  // ignore: prefer-correct-identifier-length
  static const double ed = 24;

  // Spacers vertical
  static const SizedBox vSpaceS = SizedBox(height: cp);
  static const SizedBox vSpaceM = SizedBox(height: md);
  static const SizedBox vSpaceL = SizedBox(height: ed);
  // Spacers horizontal
  static const SizedBox hSpaceS = SizedBox(width: cp);
  static const SizedBox hSpaceM = SizedBox(width: md);
  static const SizedBox hSpaceL = SizedBox(width: ed);

  AppInsets._();

  
}
