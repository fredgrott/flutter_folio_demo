// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally part of the layout library which is under
// MIT License Copyright 2019 by Jaime Blasco


import 'package:flutter/material.dart';
import 'package:folio/src/presentation/widgets/layout_context.dart';
import 'package:gap/gap.dart';

class Gutter extends StatelessWidget {
  final double? extent;
  const Gutter([
    this.extent,
    Key? key,
  ]) : super(key: key);

  static List<Widget> separateChildren({
    required List<Widget> children,
    double? extent,
  }) =>
      children.separate(extent);

  @override
  Widget build(BuildContext context) {
    return Gap(extent ?? context.layout.gutter);
  }
}

// ignore: prefer-single-widget-per-file
class SliverGutter extends StatelessWidget {
  final double? extent;
  const SliverGutter([
    this.extent,
    Key? key,
  ]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGap(extent ?? context.layout.gutter);
  }
}

extension ListGutter on List<Widget> {
  List<Widget> separate(double? extend) => length <= 1
      ? this
      : sublist(1).fold(
          [first],
          (r, element,) => [...r, Gutter(extend), element,],
        );
}
