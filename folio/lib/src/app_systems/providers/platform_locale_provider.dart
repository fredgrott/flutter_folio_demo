// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/domain/models/platform_locale_interface.dart';

/// Platform Locale Provider
/// Returns the locale of the Platform.localeName.
final platformLocaleProvider = Provider<Locale>((_) {
  // Get the platform language using platform specific implementations
  final Locale _platformLocale = PlatformLocale().getPlatformLocale();

  log("Retrieved platform locale: $_platformLocale");

  return _platformLocale;
});
