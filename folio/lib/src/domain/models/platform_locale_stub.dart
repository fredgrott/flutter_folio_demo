// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:folio/src/domain/models/platform_locale_interface.dart';

// ignore: prefer-static-class
PlatformLocale getImplementation() => throw UnsupportedError(
    'Cannot get Platform Locale without dart:html or package:shared_preferences',);
