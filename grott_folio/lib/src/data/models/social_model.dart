// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grott_folio/src/domain/entities/social_item_data.dart';

class SocialModel {
  final List<SocialItemData> _items = [
    const SocialItemData(
      FontAwesomeIcons.behance,
      "BeHance",
      "https://www.behance.net/gwsfredgrott",
    ),
    const SocialItemData(
      FontAwesomeIcons.dribbble,
      "Dribbble",
      "https://dribbble.com/FredGrott",
    ),
    const SocialItemData(
      FontAwesomeIcons.github,
      "GitHub",
      "https://github.com/fredgrott",
    ),
    const SocialItemData(
      FontAwesomeIcons.instagram,
      "Instagram",
      "https://www.instagram.com/fredgrott/",
    ),
    const SocialItemData(
      FontAwesomeIcons.linkedin,
      "LinkedIN",
      "https://www.linkedin.com/in/fredgrottstartupfluttermobileappdesigner/",
    ),
    const SocialItemData(
      FontAwesomeIcons.medium,
      "Medium",
      "https://fredgrott.medium.com",
    ),
    const SocialItemData(
      FontAwesomeIcons.twitter,
      "Twitter",
      "https://twitter.com/fredgrott",
    ),
    const SocialItemData(
      FontAwesomeIcons.youtube,
      "Youtube",
      "https://www.youtube.com/c/FredGrott",
    ),
  ];

  List<SocialItemData> get items => _items;
}
