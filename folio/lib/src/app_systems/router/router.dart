// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:folio/src/app_systems/router/app_router_observer.dart';
import 'package:folio/src/app_systems/router/router_notifier.dart';
import 'package:folio/src/app_systems/router/routes.dart';
import 'package:folio/src/shared_scaffold.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _rootRouterKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

final _shellRouterKey = GlobalKey<NavigatorState>(debugLabel: 'shellRouterKey');

/// This simple provider caches our GoRouter.
/// This provider will never rebuild by design.
@riverpod
// ignore: prefer-static-class
GoRouter router(RouterRef ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
    routes: [
      ShellRoute(
        builder: (
          BuildContext context,
          GoRouterState state,
          Widget child,
        ) {
          return SharedScaffold(child: child);
        },
        observers: [AppRouterObserver()],
        routes: notifier.routes,
        navigatorKey: _shellRouterKey,
      ),
    ],
    refreshListenable: notifier,
    initialLocation: HomeRoute.path,
    debugLogDiagnostics: true,
    navigatorKey: _rootRouterKey,
  );
}
