// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original MIT License copyright 2021 by Mike Rydstrom
// see https://gist.github.com/rydmike/f2f45a57d4998f3c61d3fa197b5a7370

import 'package:flutter/material.dart';

/// AppCenteredConstrainedBody centers the app screen content.
/// Has the web platform assumption that the web footer is
/// applied as part of app screen content.
///
/// Modifications from Mike Rydstrom's example is I bump up the maxWidth
/// see github gist
/// https://gist.github.com/rydmike/f2f45a57d4998f3c61d3fa197b5a7370
/// 
/// General usage is
///  AppCenterConstrainedBody(
///        child: CustomScrollView(
///          slivers: <Widget>[
///            SliverList()
///         ]
///       )
///     )
/// ```dart
/// 
/// ```
/// 
/// Usage note, usually one would optionally set the box constraints per app screen 
/// and one would also set padding per screen as that will be the actual screen 
/// margin and thus you need to adjust that per the breakpoints for compact, medium,
/// and expanded. In my use case I get the padding values from the [AppInsets] 
/// class. Because of those factors I move where this AppCenteredConstrainedBody is 
/// applied from the [AppSharedScaffold] to the actual individual AppScreen.
///
/// @author Fredrick Allan grott.
class AppCenteredConstrainedBody extends StatelessWidget {
  /// Optional scroll controller for the constrained page body.
  ///
  /// If you use a scrolling view as child to the page body, that needs a
  /// scroll controller, we need to use the same controller here too.
  ///
  /// If null, a default controller is used.
  final ScrollController? controller;

  /// The constraints for the constrained layout.
  ///
  /// Default to max width constraint, with a value of 900 dp.
  final BoxConstraints constraints;

  /// Directional padding around the page body.
  ///
  /// Defaults to EdgeInsets.symmetric(horizontal: 16).
  final EdgeInsetsGeometry padding;

  /// Child to be wrapped in the centered width constrained body, with an
  /// un-focus tap handler, the way an app should behave.
  final Widget child;

  const AppCenteredConstrainedBody({
    super.key,
    this.controller,
    this.constraints = const BoxConstraints(maxWidth: 1200),
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // We want the scroll bars to be at the edge of the screen, not next to the
    // width constrained content. If we use the built in scroll bars of the
    // in a scrolling child, it will be next to the child, not at the edge of
    // the screen where it belongs.
    return Scrollbar(
      controller: controller,
      child: Center(
        child: ConstrainedBox(
          constraints: constraints,
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
