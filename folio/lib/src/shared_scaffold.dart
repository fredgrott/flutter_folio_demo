// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/app_systems/providers/locale_state_provider.dart';

class SharedScaffold extends ConsumerStatefulWidget  {
  final Widget child;
  const SharedScaffold({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<SharedScaffold> createState() => _SharedScaffoldState();
}

class _SharedScaffoldState extends ConsumerState<SharedScaffold> {

  



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  // initialize the locale
  @override
  void initState() {
    super.initState();
    final widgetsBinding = WidgetsBinding.instance;
    if (widgetsBinding != null) {
      widgetsBinding.addPostFrameCallback((_) async {
        // Locale Startup Actions
        ref.read(localeStateProvider.notifier).initLocale();
      });
    }
  }
}
