// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// 
/// 
/// @author Fredrick Allan Grott.
class NavItemData extends Equatable {
  final IconData itemIcon;
  final String itemName;
  final String itemRouteString;

  @override
  List<Object?> get props => [
        itemIcon,
        itemName,
        itemRouteString,
      ];

  const NavItemData(
    this.itemIcon,
    this.itemName,
    this.itemRouteString,
  );
}
