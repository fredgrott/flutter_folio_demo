// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'base_page_object.dart';
import 'find_ext.dart';
import 'page_element.dart';

/// Find extensions for list with additional index param
/// Used in group page objects for retreivind nested widgets.
extension ListFinderExt on BasePageObject {
  /// Find element by type and position in group.
  PageElement listElementByType(Type type, int index,) => element(
        find.descendant(of: this, matching: find.byType(type).at(index),),
      );

  /// Find element by key and position in group.
  PageElement listElementByKey(Key key, int index,) => element(
        find.descendant(of: this, matching: find.byKey(key).at(index),),
      );
}
