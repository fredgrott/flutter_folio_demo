// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:grott_folio/src/application/app_screen_breakpoints.dart';
import 'package:grott_folio/src/application/app_ui_measures.dart';
import 'package:grott_folio/src/presentation/widgets/desktop_footer.dart';
import 'package:grott_folio/src/presentation/widgets/mobile_footer.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppUIMeasures.physicalWidth >= AppScreenBreakpoints.mediumEnd
        ? DesktopFooter()
        : MobileFooter();
  }

}
