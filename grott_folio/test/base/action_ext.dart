// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'base_page_object.dart';

/// Basic action extensions for [BasePageObject].
extension ActionExt on BasePageObject {
  /// Dispatch [WidgetController.tap] action.
  Future<void> tap() async {
    await tester.tap(this);
  }

  /// Dispatch [WidgetTester.enterText] action.
  Future<void> enterText(String text) async {
    await tester.enterText(this, text,);
  }
}
