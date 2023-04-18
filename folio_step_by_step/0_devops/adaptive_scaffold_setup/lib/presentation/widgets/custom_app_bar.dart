// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:adaptive_scaffold_setup/presentation/widgets/app_title_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // so can use drawerBreakpoint.isActive(context) ??  myActions: null
  // to apply actions nav block
  final Breakpoint drawerBreakpoint;

  const CustomAppBar({super.key, this.drawerBreakpoint = Breakpoints.small,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const AppTitleLogo(),
      actions: [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90.0);
}
