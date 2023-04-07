// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appShellRouteData,
    ];

RouteBase get $appShellRouteData => ShellRouteData.$route(
      factory: $AppShellRouteDataExtension._fromState,
      navigatorKey: AppShellRouteData.$navigatorKey,
      routes: [
        GoRouteData.$route(
          path: '/home',
          factory: $HomeRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/books',
          factory: $BooksRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/info',
          factory: $InfoRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/showcase',
          factory: $ShowcaseRouteDataExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/uikits',
          factory: $UIKitsRouteDataExtension._fromState,
        ),
      ],
    );

extension $AppShellRouteDataExtension on AppShellRouteData {
  static AppShellRouteData _fromState(GoRouterState state) =>
      AppShellRouteData();
}

extension $HomeRouteDataExtension on HomeRouteData {
  static HomeRouteData _fromState(GoRouterState state) => const HomeRouteData();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $BooksRouteDataExtension on BooksRouteData {
  static BooksRouteData _fromState(GoRouterState state) =>
      const BooksRouteData();

  String get location => GoRouteData.$location(
        '/books',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $InfoRouteDataExtension on InfoRouteData {
  static InfoRouteData _fromState(GoRouterState state) => const InfoRouteData();

  String get location => GoRouteData.$location(
        '/info',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ShowcaseRouteDataExtension on ShowcaseRouteData {
  static ShowcaseRouteData _fromState(GoRouterState state) =>
      const ShowcaseRouteData();

  String get location => GoRouteData.$location(
        '/showcase',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $UIKitsRouteDataExtension on UIKitsRouteData {
  static UIKitsRouteData _fromState(GoRouterState state) =>
      const UIKitsRouteData();

  String get location => GoRouteData.$location(
        '/uikits',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
