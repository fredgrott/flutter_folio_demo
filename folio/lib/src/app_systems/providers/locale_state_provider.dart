// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/app_systems/notifiers/locale_state_notifier.dart';
import 'package:folio/src/domain/models/locale_state.dart';


final StateNotifierProvider<LocaleStateNotifier, LocaleState> localeStateProvider =
    StateNotifierProvider<LocaleStateNotifier, LocaleState>(
        (ref) => LocaleStateNotifier(ref),);
