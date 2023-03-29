// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally in the Flutter Adaptive Scaffold package
// Copyright 2013 The Flutter Authors. All rights reserved.

import 'package:flutter/material.dart';

abstract class AppBreakpoint {
  /// Returns a const [Breakpoint].
  const AppBreakpoint();

  /// A method that returns true based on conditions related to the context of
  /// the screen such as MediaQuery.of(context).size.width.
  bool isActive(BuildContext context);
}
