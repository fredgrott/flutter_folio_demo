// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ChangeNotifierProvider. Usage is this in a Consumer Widget:
/// ```
/// final sc = ref.watch(scrollControllerProvider);
/// ```
///
/// Needs to be implemented manually as it is legacy and not generatable
/// by riverpod generator.
///
/// @author Fredrick Allan Grott.
final scrollServiceProvider =
    ChangeNotifierProvider.autoDispose((ref) => ScrollController());
