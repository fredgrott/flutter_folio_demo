// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:folio/src/app_systems/providers/locale_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final localeProvider = Provider<Locale>((ref) {
  return ref.watch(localeStateProvider).locale;
});
