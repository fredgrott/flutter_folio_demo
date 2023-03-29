// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally from Flex Color Scheme examples
// Copyright (c) 2021 Mike Rydstrom

import 'package:flutter/material.dart';

/// Centers content of screen. Usage is:
///
/// ```
/// ScreenWrapper(
///        child: CustomScrollView()
/// ```
///
/// Per blog post at
/// https://rydmike.com/blog_layout_and_theming
/// 
/// @author Fredrick Allan Grott.
class ScreenWrapper extends StatelessWidget {
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

  const ScreenWrapper({
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
