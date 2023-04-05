// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grott_folio/src/domain/entities/nav_item_data.dart';

class NavModel {
  final List<NavItemData> _items = [
    const NavItemData(
      Icons.book, "Books", "/books",
    ),
    const NavItemData(
      Icons.home, "Home", "/",
    ),
    const NavItemData(
      Icons.info,
      "Info",
      "/info",
    ),
    const NavItemData(
      FontAwesomeIcons.dev,
      "Showcase",
      "/showcase",
    ),
    const NavItemData(
      FontAwesomeIcons.uikit,
      "UIKits",
      "/uikits",
    ),
  ];

  List<NavItemData> get items => _items;

}
