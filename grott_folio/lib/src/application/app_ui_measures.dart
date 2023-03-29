// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:ui';

class AppUIMeasures {
  static final double pixelRatio = window.devicePixelRatio;

  static final Size physicalScreenSize = window.physicalSize;
  static final double physicalWidth = physicalScreenSize.width;
  static final double physicalHeight = physicalScreenSize.height;

  static final logicalScreenSize = window.physicalSize / pixelRatio;
  static final double logicalWidth = logicalScreenSize.width;
  static final double logicalHeight = logicalScreenSize.height;

  // safe area
  static final ViewPadding padding = window.padding;
  static final double paddingLeft =
      window.padding.left / window.devicePixelRatio;
  static final double paddingRight =
      window.padding.right / window.devicePixelRatio;
  static final double paddingTop = window.padding.top / window.devicePixelRatio;
  static final double paddingBottom =
      window.padding.bottom / window.devicePixelRatio;

  // safe area
  static final double safeWidth = logicalWidth - paddingLeft - paddingRight;
  static final double safeHeight = logicalHeight - paddingTop - paddingBottom;
  

  

  AppUIMeasures._();
}
