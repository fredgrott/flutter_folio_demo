// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grott_folio/src/application/routes/go_router_observer.dart';
import 'package:grott_folio/src/presentation/features/books_screen/books_screen.dart';
import 'package:grott_folio/src/presentation/features/home_screen/home_screen.dart';
import 'package:grott_folio/src/presentation/features/info_screen/info_screen.dart';
import 'package:grott_folio/src/presentation/features/showcase_screen/showcase_screen.dart';
import 'package:grott_folio/src/presentation/features/uikits_screen/uikits_screen.dart';
import 'package:grott_folio/src/presentation/widgets/app_shared_scaffold.dart';

part 'app_router.g.dart';

// ignore: prefer-static-class
final GlobalKey<NavigatorState> appRootNavigatorKey =
    GlobalKey<NavigatorState>();
// ignore: prefer-static-class
final GlobalKey<NavigatorState> appShellNavigatorKey =
    GlobalKey<NavigatorState>();

// ignore: prefer-static-class
final GoRouter appRouter = GoRouter(
  routes: $appRoutes, 
  errorBuilder: (context, state,) => const Scaffold(body: Center(child: Text('This my custom errorpage', textAlign: TextAlign.center,))), 
  initialLocation: '/home', 
  observers: [GoRouterObserver()], 
  navigatorKey: appRootNavigatorKey,
);

@TypedShellRoute<AppShellRouteData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRouteData>(path: '/home'),
    TypedGoRoute<BooksRouteData>(path: '/books'),
    TypedGoRoute<InfoRouteData>(path: '/info'),
    TypedGoRoute<ShowcaseRouteData>(path: '/showcase'),
    TypedGoRoute<UIKitsRouteData>(path: '/uikits'),
  ],
)
class AppShellRouteData extends ShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = appShellNavigatorKey;

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return AppSharedScaffold(
      appScreen: navigator,
    );
  }
}

class HomeRouteData extends GoRouteData {
  const HomeRouteData();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return HomeScreen();
  }
}

class BooksRouteData extends GoRouteData {
  const BooksRouteData();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return BooksScreen();
  }
}

class InfoRouteData extends GoRouteData {
  const InfoRouteData();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return InfoScreen();
  }
}

class ShowcaseRouteData extends GoRouteData {
  const ShowcaseRouteData();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return ShowcaseScreen();
  }
}

class UIKitsRouteData extends GoRouteData {
  const UIKitsRouteData();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return UIKitsScreen();
  }
}
