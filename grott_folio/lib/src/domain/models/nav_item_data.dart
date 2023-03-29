// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:equatable/equatable.dart';

class NavItemData extends Equatable {
  final String name;
  final String route;

  @override
  List<Object?> get props => [
        name,
        route,
      ];

  const NavItemData({
    required this.name,
    required this.route,
  });
}
