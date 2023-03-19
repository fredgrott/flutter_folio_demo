// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:folio/src/domain/models/platform_locale_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'platform_locale_service.g.dart';

@riverpod
// ignore: prefer-static-class
Locale platformLocaleService(ProviderRef<Locale> _) {
  // Get the platform language using platform specific implementations
  final Locale platformLocale = PlatformLocale().getPlatformLocale();

  log("Retrieved platform locale: $platformLocale");

  return platformLocale;
}
