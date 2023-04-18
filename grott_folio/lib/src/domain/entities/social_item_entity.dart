// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SocialItemEntity extends Equatable {

  final IconData itemIcon;
  final String itemName;
  final String itemUriString;

  @override
  List<Object?> get props => [itemIcon, itemName, itemUriString,];

  const SocialItemEntity(this.itemIcon, this.itemName, this.itemUriString,);

}
