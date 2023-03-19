// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



// global appLogger
// ignore: prefer-static-class
import 'package:folio/src/app_systems/logging/application_logger.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logger_service.g.dart';

// ignore: prefer-static-class
late final Logger appLogger;

@riverpod
// ignore: prefer-static-class
Logger loggerService(ProviderRef<Object?> ref) => Logger(loggerName);
