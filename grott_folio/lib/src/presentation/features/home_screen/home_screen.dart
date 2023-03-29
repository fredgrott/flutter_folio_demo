// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:grott_folio/src/application/app_insets.dart';
import 'package:grott_folio/src/application/app_ui_measures.dart';
import 'package:grott_folio/src/presentation/widgets/app_centered_constrained_body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppCenteredConstrainedBody(
      constraints: BoxConstraints(maxWidth: AppUIMeasures.physicalWidth),
      // content slides under navbar, thus we need top padding to be the same 
      // height as the navbar
      padding: const EdgeInsets.only(top: 90,),
      child: CustomScrollView(
        slivers: [
          // content of app screen
          SliverList(
            delegate: SliverChildListDelegate([
              AppInsets.vSpaceL,
              const Text("Home"),
            ]),
          ),
          // Make sure to space footer to be at bottom if we 
          // have content that is less than screen height. The way 
          // it works is this Sliver fills whatever space is left in 
          // viewport if there is space left in the viewport.
          SliverFillRemaining(
            child: Container(),
          ),
          // fixed footer
          SliverList(
            delegate: SliverChildListDelegate([
              AppInsets.vSpaceL,
              const Text("Footer"),
            ]),
          ),
        ],
      ),
    );
  }
}
