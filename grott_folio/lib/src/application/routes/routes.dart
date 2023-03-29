// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grott_folio/src/application/routes/app_paths.dart';
import 'package:grott_folio/src/application/routes/go_router_observer.dart';
import 'package:grott_folio/src/application/routes/nav_keys.dart';
import 'package:grott_folio/src/presentation/features/books_screen/books_screen.dart';
import 'package:grott_folio/src/presentation/features/home_screen/home_screen.dart';
import 'package:grott_folio/src/presentation/features/info_screen/info_screen.dart';
import 'package:grott_folio/src/presentation/features/showcase_screen/showcase_screen.dart';
import 'package:grott_folio/src/presentation/features/uikits_screen/uikits_screen.dart';
import 'package:grott_folio/src/presentation/widgets/app_shared_scaffold.dart';


// ignore: prefer-static-class
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    ShellRoute(builder: (BuildContext context, GoRouterState state, Widget child,) {
      return AppSharedScaffold(appScreen: child,);
    }, 
    routes: <RouteBase>[
      GoRoute(
        path: AppPaths.homeScreenRoutePath, 
        
        builder: (BuildContext context, GoRouterState state,) {
          return HomeScreen();
        },
      ), 
      GoRoute(
        path: AppPaths.booksScreenRoutePath, 
        
        builder: (BuildContext context, GoRouterState state,) {
          return BooksScreen();
        },
      ), 
      GoRoute(
        path: AppPaths.infoScreenRoutePath, 
        
        builder: (BuildContext context, GoRouterState state,) {
          return InfoScreen();
        },
      ), 
      GoRoute(
        path: AppPaths.showcaseScreenRoutePath, 
        
        builder: (BuildContext context, GoRouterState state,) {
          return ShowcaseScreen();
        },
      ), 
      GoRoute(
        path: AppPaths.uikitsScreenRoutePath, 
        
        builder: (BuildContext context, GoRouterState state,) {
          return UIKitsScreen();
        },
      ),
    ], 
    navigatorKey: shellNavigatorKey,
  ),
], 
initialLocation: '/', 
observers: [GoRouterObserver()], 
navigatorKey: rootNavigatorKey,
);
