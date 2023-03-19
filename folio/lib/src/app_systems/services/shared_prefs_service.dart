// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs_service.g.dart';

@riverpod
// ignore: prefer-static-class
Future sharedPrefsService(FutureProviderRef<Object?> ref) =>
    SharedPreferences.getInstance();
