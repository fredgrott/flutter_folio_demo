// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';

class InitLogging {
  static final InitLogging _initLogging = InitLogging._internal();

  factory InitLogging() {
    return _initLogging;
  }

  InitLogging._internal() {
    _init();
  }

  void _init() {
    // set to get all logging output
    Logger.root.level = Level.ALL;

    Logger.root.onRecord.listen((LogRecord rec) {
      // if we have both rec.error and rec.stackTrace
      if (rec.error != null && rec.stackTrace != null) {
        log(
          'level: ${rec.level.name} loggerName: ${rec.loggerName} time: ${rec.time} message: ${rec.message} error: ${rec.error} exception: ${rec.stackTrace}',
        );
      // if we have rec.error
      } else if (rec.error != null) {
        log('level: ${rec.level.name} loggerName: ${rec.loggerName} time: ${rec.time} message: ${rec.message} error: ${rec.error}');
      // if we do not have rec.error and do not have rec.stacktrace
      } else {
        log('level: ${rec.level.name} loggerName: ${rec.loggerName} time: ${rec.time} message: ${rec.message}');
      }
    });

    // so to get colored logs in console
    // logging in dart apps would be
    // PrintAppender.setupLogging(stderrLevel: Level.SEVERE);
    PrintAppender(formatter: const ColorFormatter()).attachToLogger(Logger.root);

    // Any custom LoggingAppenders go here for example logging to logz.io service 
  }
}
