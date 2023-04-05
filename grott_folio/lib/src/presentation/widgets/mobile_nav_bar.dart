// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:grott_folio/src/application/app_paddings.dart';
import 'package:grott_folio/src/application/app_ui_measures.dart';
import 'package:grott_folio/src/presentation/widgets/app_logo.dart';

class MobileNavBar extends StatelessWidget {

  final VoidCallback? onMenu;

  const MobileNavBar({super.key, this.onMenu,});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppPaddings.paddingFour, 
        horizontal: AppPaddings.paddingFour,
      ), 
      width: AppUIMeasures.physicalWidth, 
      // ignore: no-magic-number
      height: 90, 
      child: Row(
        children: [
          IconButton(
            onPressed: onMenu, 
            icon: const Icon(Icons.menu,),
          ),
          const Spacer(),
          const AppLogo(),
        ],
      ),
    );
  }
}
