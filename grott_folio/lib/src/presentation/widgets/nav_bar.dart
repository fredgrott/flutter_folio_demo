// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:boxy/flex.dart';
import 'package:flutter/material.dart';
import 'package:grott_folio/src/application/app_screen_breakpoints.dart';
import 'package:grott_folio/src/application/app_ui_measures.dart';
import 'package:grott_folio/src/presentation/widgets/app_logo.dart';



class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppUIMeasures.physicalWidth >= AppScreenBreakpoints.mediumEnd
        ? SizedBox(
            width: AppUIMeasures.physicalWidth,
            // ignore: no-magic-number
            height: 90,
            child: BoxyRow(
              mainAxisSize: MainAxisSize.min,
              // Logo will be greater in height but we want the
              // other row items to align with it so we use BoxyRow and
              // Dominant to make that happen
              children: [
                Dominant(
                  child: AppLogo(),
                ),
                Spacer(),
              ],
            ),
          )
        : SizedBox(
            width: AppUIMeasures.physicalWidth,
            // ignore: no-magic-number
            height: 90,
            child: BoxyRow(
              mainAxisSize: MainAxisSize.min,
              // Logo will be greater in height but we want the
              // other row items to align with it so we use BoxyRow and
              // Dominant to make that happen
              children: [
                Dominant(
                  child: AppLogo(),
                ),
                Spacer(),
                InkWell(
                  child: Icon(Icons.menu),
                ),
              ],
            ),
        );
  }
}
