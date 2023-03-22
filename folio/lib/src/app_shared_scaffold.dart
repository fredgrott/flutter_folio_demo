// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/domain/models/locale_state_model.dart';

class AppSharedScaffold extends ConsumerStatefulWidget {
  final Widget child;

  const AppSharedScaffold(this.child);

  @override
  ConsumerState<AppSharedScaffold> createState() => _AppSharedScaffoldState();
}

class _AppSharedScaffoldState extends ConsumerState<AppSharedScaffold> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  // initialize the locale
  @override
  void initState() {
    super.initState();
    final widgetsBinding = WidgetsBinding.instance;
    if (widgetsBinding != null) {
      widgetsBinding.addPostFrameCallback((_) async {
        // Locale Startup Actions
        ref.read(localeStateModelProvider.notifier).initLocale();
      });
    }
  }
}
