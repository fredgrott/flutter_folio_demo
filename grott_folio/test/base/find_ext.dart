// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base_page_object.dart';
import 'page_element.dart';

/// Basic find extensions for [BasePageObject]
/// Used in group page objects for retreivind nested widgets.
extension FindExt on BasePageObject {
  /// [CommonFinders.descendant].
  PageElement elementByKey(Key key) => element(
        find.descendant(of: this, matching: find.byKey(key),),
      );

  /// [CommonFinders.descendant].
  PageElement elementByType(Type type) => element(
        find.descendant(of: this, matching: find.byType(type),),
      );

  /// Construct [PageElement] for given finder
  ///
  /// @param finder.
  PageElement element(Finder finder) => PageElement(
        tester,
        finder,
      );
}
