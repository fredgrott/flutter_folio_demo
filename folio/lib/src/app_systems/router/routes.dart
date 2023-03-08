// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:folio/src/books_feature/books_screen.dart';
import 'package:folio/src/home_feature/home_screen.dart';
import 'package:folio/src/info_feature/info_screen.dart';
import 'package:folio/src/lab_feature/lab_screen.dart';
import 'package:folio/src/showcase_feature/showcase_screen.dart';

import 'package:folio/src/uikits_feature/uikits_screen.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

// Note: As of Go Router 6.2 we still do not have real Typed Route Shell Route support via
//       Go Router Builder so used a hack of keeping all routes as children of ? to get
//       a functional shell route routes list. Obviously, this hack will not work for
//       more complicated nested paths.
//
//       But it is safe to use as the changes to builder to support generating shell routes is
//       almost complete accoding to issue reports as of March 4, 2023.

/// This is shell route declaration of routes
/// associated with the shared scaffold.
///
/// @author Fredrick Allan Grott.
@TypedGoRoute<HomeRoute>(
  path: "/",
  routes: [
    TypedGoRoute<BooksRoute>(path: BooksRoute.path),
    TypedGoRoute<InfoRoute>(path: InfoRoute.path),
    TypedGoRoute<HomeRoute>(path: HomeRoute.path),
    TypedGoRoute<LabRoute>(path: LabRoute.path),
    TypedGoRoute<ShowcaseRoute>(path: ShowcaseRoute.path),
    TypedGoRoute<UIKitsRoute>(path: UIKitsRoute.path),
  ],
)
class HomeRoute extends GoRouteData {
  static const path = 'home';
  const HomeRoute();

  // any user signup and login redirects would go here
  // and be paried up with a required notifier listener

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return HomeScreen();
  }
}

class LabRoute extends GoRouteData {
  static const path = 'lab';
  const LabRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return LabScreen();
  }
}

class BooksRoute extends GoRouteData {
  static const path = 'books';
  const BooksRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return BooksScreen();
  }
}

class InfoRoute extends GoRouteData {
  static const path = 'info';
  const InfoRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return InfoScreen();
  }
}

class ShowcaseRoute extends GoRouteData {
  static const path = 'showcase';
  const ShowcaseRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return ShowcaseScreen();
  }
}

class UIKitsRoute extends GoRouteData {
  static const path = 'uikits';
  const UIKitsRoute();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) {
    return UIKitsScreen();
  }
}
