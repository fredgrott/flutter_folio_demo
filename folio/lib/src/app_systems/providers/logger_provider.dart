// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: prefer_typing_uninitialized_variables, type_annotate_public_apis

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/app_systems/logging/application_logger.dart';
import 'package:logging/logging.dart';

// global appLogger
// ignore: prefer-static-class
late final appLogger;

final loggerProvider = Provider((ref) => Logger(loggerName));
