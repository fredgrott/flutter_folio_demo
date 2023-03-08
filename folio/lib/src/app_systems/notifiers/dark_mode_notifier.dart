// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// DarkModeNotifier to track dark mode.
///
/// Usage is:
/// ```
/// var darkMode = ref.watch(darkModeProvider);
/// ```
///
/// @author Fredrick Allan Grott.
class DarkModeNotifier extends StateNotifier<bool> {
  late SharedPreferences prefs;

  DarkModeNotifier() : super(false) {
    _init();
  }

  /// Use is
  /// ```
  /// Switch(
  ///               value: darkMode,
  ///               onChanged: (val) {
  ///                 ref.read(darkModeProvider.notifier).toggle();
  ///              },
  /// ```
  /// I think.
  Future<void> toggle() async {
    state = !state;
    prefs.setBool(
      "darkMode",
      state,
    );
  }

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    final darkMode = prefs.getBool("darkMode");
    state = darkMode ?? false;
  }
}
