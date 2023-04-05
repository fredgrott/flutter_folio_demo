// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:grott_folio/src/application/app_ui_measures.dart';

class DesktopFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppUIMeasures.physicalWidth,
      // ignore: no-magic-number
      height: 200,
      child: const Text("Footer"),
    );
  }
}
