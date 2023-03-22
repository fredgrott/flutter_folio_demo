// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/app_systems/providers/app_bootstrap.dart';

import 'package:folio/src/my_app.dart';

/// Serves as entry point of the application.
/// 
/// @author Fredrick Allan Grott.
void main() async {
  // runZoneGuarder will run the body of this function in an error zone
  runZonedGuarded<Future<void>>(
      () async {
        // runApp inflates the widget attaches it the screen
        runApp(
          // exposes the provided ProviderContainer to the widget tree
          UncontrolledProviderScope(
            container: await appBootstrap(),
            child: MyApp(),
          ),
        );
      },
      (
        Object error,
        StackTrace stack,
      ) {
        // if using a 3rd party error service, then we call that api here to pass the error to
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
