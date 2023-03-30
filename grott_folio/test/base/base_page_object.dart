// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/// The [BasePageObject] delegates [Finder] functionality.
/// 
/// @author Fredrick Allan Grott.
abstract class BasePageObject extends Finder {
  /// Link to tester for easier use of extension.
  final WidgetTester tester;

  /// Link to object's finder for creaty copy of object.
  @protected
  final Finder finder;

  @override
  String get description => finder.description;


  
  BasePageObject(this.tester, this.finder,);

  

  @override
  Iterable<Element> apply(Iterable<Element> candidates) =>
      finder.apply(candidates);

  

  @override
  Iterable<Element> evaluate() => finder.evaluate();

  @override
  bool precache() => finder.precache();
}
