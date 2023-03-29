// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:catcher/handlers/console_handler.dart';
import 'package:catcher/handlers/email_manual_handler.dart';
import 'package:catcher/mode/dialog_report_mode.dart';

import 'package:catcher/model/catcher_options.dart';
import 'package:grott_folio/src/application/catcher/custom_catcher_logger.dart';

// ignore: prefer-static-class
final CatcherOptions debugOptions = CatcherOptions(
  DialogReportMode(),
  [
    ConsoleHandler(
      enableDeviceParameters: true, 
      enableApplicationParameters: true, 
      enableStackTrace: true, 
      enableCustomParameters: true, 
      handleWhenRejected: true,
    ),
  ],
  logger: CustomCatcherLogger(),
);

// ignore: prefer-static-class
final CatcherOptions releaseOptions = CatcherOptions(DialogReportMode(), [
  EmailManualHandler(["recipient@email.com"],),
],);
