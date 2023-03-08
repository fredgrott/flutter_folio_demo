// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:ui';

import 'package:folio/src/domain/models/platform_locale_stub.dart' // Stub implementation
    if (dart.library.io) 'package:folio/src/domain/models/platform_locale_mobile.dart' // dart:io implementation
    if (dart.library.html) 'package:folio/src/domain/models/platform_locale_web.dart'; // dart:html implementation

abstract class PlatformLocale {
  // Return the correct implementation
  factory PlatformLocale() => getImplementation();

  Locale getPlatformLocale();
}
