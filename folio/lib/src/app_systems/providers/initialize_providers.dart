// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/app_systems/providers/dark_mode_provider.dart';
import 'package:folio/src/app_systems/providers/logger_provider.dart';
import 'package:folio/src/app_systems/providers/scaffold_messenger_key_pod.dart';
import 'package:folio/src/app_systems/providers/scaffold_messenger_pod.dart';
import 'package:folio/src/app_systems/providers/scroll_controller_provider.dart';
import 'package:folio/src/app_systems/providers/shared_prefs_provider.dart';

/// Triggered from bootstrap() to complete futures.
Future<void> initializeProviders(ProviderContainer container) async {
  /// Core
  await container.read(sharedPrefsProvider.future);

  container.read(darkModeProvider);

  container.read(loggerProvider);

  container.read(scaffoldMessengerKeyPod);

  container.read(scaffoldMessengerPod);

  container.read(scrollControllerProvider);
}
