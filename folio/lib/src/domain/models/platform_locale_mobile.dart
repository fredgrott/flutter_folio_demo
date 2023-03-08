// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:folio/src/domain/models/platform_locale_interface.dart';

class PlatformLocaleMobile implements PlatformLocale {
  @override
  Locale getPlatformLocale() {
    final String _platformLocaleName = Platform.localeName;
    log("Platform Locale Name (Mobile): $_platformLocaleName");

    // Language code only
    if (_platformLocaleName.length == 2) {
      return Locale.fromSubtags(languageCode: _platformLocaleName);
    }

    // Language and country codes
    final String _languageCode =
        _platformLocaleName.substring(0, _platformLocaleName.indexOf('_'),);
    final String _countryCode =
        _platformLocaleName.substring(_platformLocaleName.indexOf('_') + 1);

    return Locale.fromSubtags(
      languageCode: _languageCode,
      countryCode: _countryCode,
    );
  }
}

// ignore: prefer-static-class
PlatformLocale getImplementation() => PlatformLocaleMobile();
