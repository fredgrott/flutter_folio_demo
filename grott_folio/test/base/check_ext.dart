// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart' as ft;
import 'package:flutter_test/flutter_test.dart';

import 'base_page_object.dart';

/// Basic check extensions for [BasePageObject].
extension CheckExt on BasePageObject {
  /// Extension for [ft.expect].
  void expect(
    Matcher matcher, {
    String? reason,
    dynamic skip,
  }) {
    ft.expect(this, matcher, reason: reason, skip: skip,);
  }
}
