// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Note: need
//       1. type that provider will use
//       2. function name that Provider suffix will be added to
//       3. supplied TypRef ref parameter
//       4. function body to return

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'supported_locales_service.g.dart';

@riverpod
// ignore: prefer-static-class
List<Locale> supportedLocalesService(ProviderRef<List<Locale>> _) {
  return const [
    Locale(
      'en',
      'US',
    ),
    Locale(
      'ja',
      'JP',
    ),
  ];
}
