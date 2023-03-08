// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/app_systems/notifiers/dark_mode_notifier.dart';

/// Get's referenced via
/// ```
///  var darkMode = ref.watch(darkModeProvider);
/// ```
/// 
/// @author Fredrick Allan Grott.
final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>(
  (ref) => DarkModeNotifier(),
);
