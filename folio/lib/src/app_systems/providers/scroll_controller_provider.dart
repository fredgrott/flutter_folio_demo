// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ScrollController is a ChangeNotifier as it is mutable thus need a
/// ChangeNotifierProvider. Usage is this in a Consumer Widget:
/// ```
/// final sc = ref.watch(scrollControllerProvider);
/// ```
/// 
/// @author Fredrick Allan Grott.
final scrollControllerProvider = ChangeNotifierProvider.autoDispose((ref) => ScrollController());
