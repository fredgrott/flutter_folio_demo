// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:developer';

import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:grott_folio/src/application/catcher/catcher_options.dart';
import 'package:grott_folio/src/presentation/widgets/app_platform_wrapper.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      Catcher(
        runAppFunction: () {
          runApp(AppPlatformWrapper());
        }, 
        releaseConfig: releaseOptions, 
        debugConfig: debugOptions,
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
