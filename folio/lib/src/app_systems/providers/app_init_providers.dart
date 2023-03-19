// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/app_systems/services/dark_mode_service.dart';
import 'package:folio/src/app_systems/services/logger_service.dart';
import 'package:folio/src/app_systems/services/scaffold_key_services.dart';
import 'package:folio/src/app_systems/services/scroll_service_provider.dart';
import 'package:folio/src/app_systems/services/shared_prefs_service.dart';



/// Triggered from bootstrap() to complete futures.
Future<void> appInitProviders(ProviderContainer container) async {
  /// Core
  await container.read(sharedPrefsServiceProvider.future);

  container.read(darkModeServiceProvider);

  container.read(loggerServiceProvider);

  container.read(scaffoldMessengerKeyServicePod);

  container.read(scaffoldMessengerServicePod);

  container.read(scrollServiceProvider);
}
