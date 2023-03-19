// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/app_systems/logging/application_logger.dart';
import 'package:folio/src/app_systems/providers/app_init_providers.dart';
import 'package:folio/src/app_systems/services/logger_service.dart';


import 'package:folio/src/domain/models/asset_list.dart';
import 'package:url_strategy/url_strategy.dart';

/// Bootstrap the initialization logic including providers.
/// Best practices is to use ProviderContainer only for initialization  and to use
/// ref.watch and ref.read paired with the Consumer Widgets at the Screen level.
///
/// @author Fredrick Allan Grott.
// ignore: prefer-static-class
Future<ProviderContainer> appBootstrap() async {
  // Get binding of Flutter Engine for loading hooks
  final binding = WidgetsFlutterBinding.ensureInitialized();

  ApplicationLogger.init(true);

  // Cache images in assets folder via using the Flutter Engine binding
  // lifecycle.
  binding.deferFirstFrame();
  binding.addPostFrameCallback((_) {
    final Element? context = binding.renderViewElement;
    if (context != null) {
      for (final asset in assetList) {
        precacheImage(
          AssetImage(asset),
          context,
        );
      }
    }
    binding.allowFirstFrame();
  });

  setPathUrlStrategy();

  final container = ProviderContainer(
    // only for Flutter, dart apps require listening to container to get changes as
    // ProviderObserver plugs into the widget lifecycle.
    observers: [_Logger()],
  );

  await appInitProviders(container);

  // set the global appLogger
  appLogger = container.read(loggerServiceProvider);

  return container;
}

class _Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    // observability wise we do not want provider log messages in
    // production thus denugPrint is used as it is stripped out in release mode
    debugPrint(
      '''
      {
      "provider": "${provider.name ?? provider.runtimeType}",
      "newValue": "$newValue"
      }''',
    );
  }
}
