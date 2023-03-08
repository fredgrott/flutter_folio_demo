// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Supported Locales Provider
/// Update this list to expand the number of supported locales in the app.
final supportedLocalesProvider = Provider<List<Locale>>((_) {
  return const [
    Locale('en', 'US',),
    Locale('ja', 'JP',),
  ];
});
