// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool displayDesktMenu;
  final int selectedIndex;
  final Function(int) onIndexSelect;


  const CustomAppBar({
    super.key,
    required this.displayDesktMenu, required this.selectedIndex, required this.onIndexSelect,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(

    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90);
}
