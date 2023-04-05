// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:developer';

import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:grott_folio/src/application/catcher/catcher_options.dart';
import 'package:grott_folio/src/application/logging/application_logger.dart';
import 'package:grott_folio/src/application/routes/nav_keys.dart';
import 'package:grott_folio/src/data/models/asset_list.dart';

import 'package:grott_folio/src/presentation/widgets/app_platform_wrapper.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  // initialize application logger set up
  ApplicationLogger.init(true);

  // colored logging via logging appenders package
  PrintAppender(formatter: const ColorFormatter()).attachToLogger(Logger.root);

  appLogger.config("app initialized");

  // Get binding of Flutter Engine for loading hooks
  final binding = WidgetsFlutterBinding.ensureInitialized();

  // Cache images in assets folder via using the Flutter Engine binding
  // lifecycle. Google Fonts package has it's own cache impl similar
  // to this. Localization initialization is similar in impl but
  // declared in the shared scaffold stateful widget instead.
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

  // on web sets not hash, on other platforms is a NOOP
  setPathUrlStrategy();

  runZonedGuarded<Future<void>>(
    () async {
      Catcher(
          runAppFunction: () {
            runApp(AppPlatformWrapper());
          },
          releaseConfig: releaseOptions,
          debugConfig: debugOptions,
          // needed for page mode
          navigatorKey: rootNavigatorKey,
      );
    },
    (
      Object error,
      StackTrace stack,
    ) {
      log(
        error.toString(),
        stackTrace: stack,
      );
    },
    zoneSpecification: ZoneSpecification(
      // Intercept all print calls
      print: (
        self,
        parent,
        zone,
        line,
      ) {
        // Include a timestamp and the name of the App
        final messageToLog = "[${DateTime.now()}] Folio $line $zone";

        // Also print the message in the "Debug Console"
        // but it's ony an info message and contains no
        // privacy prohibited stuff
        parent.print(
          zone,
          messageToLog,
        );
      },
    ),
  );
}
