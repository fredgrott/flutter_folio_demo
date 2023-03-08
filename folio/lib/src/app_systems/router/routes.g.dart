// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $homeRoute,
    ];

GoRoute get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'books',
          factory: $BooksRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'info',
          factory: $InfoRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home',
          factory: $HomeRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'lab',
          factory: $LabRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'showcase',
          factory: $ShowcaseRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'uikits',
          factory: $UIKitsRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $BooksRouteExtension on BooksRoute {
  static BooksRoute _fromState(GoRouterState state) => const BooksRoute();

  String get location => GoRouteData.$location(
        '/books',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $InfoRouteExtension on InfoRoute {
  static InfoRoute _fromState(GoRouterState state) => const InfoRoute();

  String get location => GoRouteData.$location(
        '/info',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $LabRouteExtension on LabRoute {
  static LabRoute _fromState(GoRouterState state) => const LabRoute();

  String get location => GoRouteData.$location(
        '/lab',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ShowcaseRouteExtension on ShowcaseRoute {
  static ShowcaseRoute _fromState(GoRouterState state) => const ShowcaseRoute();

  String get location => GoRouteData.$location(
        '/showcase',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $UIKitsRouteExtension on UIKitsRoute {
  static UIKitsRoute _fromState(GoRouterState state) => const UIKitsRoute();

  String get location => GoRouteData.$location(
        '/uikits',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
