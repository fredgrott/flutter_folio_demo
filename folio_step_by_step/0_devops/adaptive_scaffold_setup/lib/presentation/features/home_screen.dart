// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:adaptive_scaffold_setup/presentation/widgets/custom_footer.dart';
import 'package:adaptive_scaffold_setup/presentation/widgets/screen_wrapper.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ScreenWrapper(
      child: CustomScrollView(
        slivers: [

          SliverFillRemaining(
            child: CustomFooter(),
          ),
        ],
      ),
    );
  }
}
