// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavItemEntity extends Equatable {
  final IconData itemIcon;
  final String itemName;
  final RouteData itemRoute;

  @override
  List<Object?> get props => [itemIcon, itemName, itemRoute,];

  const NavItemEntity(this.itemIcon, this.itemName, this.itemRoute,);
  
  
}
