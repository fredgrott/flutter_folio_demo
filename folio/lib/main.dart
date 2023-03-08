import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/app_systems/providers/bootstrap.dart';
import 'package:folio/src/my_app.dart';

void main() async {
  runZonedGuarded<Future<void>>(
      () async {
        runApp(
          UncontrolledProviderScope(
            container: await bootstrap(),
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
