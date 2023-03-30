// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:grott_folio/src/application/app_ui_measures.dart';
import 'package:grott_folio/src/presentation/widgets/desktop_nav_bar.dart';
import 'package:grott_folio/src/presentation/widgets/mobile_nav_bar.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppUIMeasures.physicalWidth >= 600 ? DesktopNavBar() : MobileNavBar();
  }
}
