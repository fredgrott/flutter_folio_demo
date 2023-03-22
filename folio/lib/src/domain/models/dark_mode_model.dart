// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dark_mode_model.g.dart';

@riverpod
class DarkModeModel extends _$DarkModeModel {
  late SharedPreferences prefs;

  @override
  bool build(){
    _init();

    return false;
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
