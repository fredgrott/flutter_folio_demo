// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:logging/logging.dart';


// ignore: prefer-static-class
const loggerName = "GrottFolio";

// ignore: prefer-static-class
late final Logger appLogger;


/// Sets up a Logger service via the ApplicationLogger.init(true) declaration that
/// has either hierarchical or non-hierarchical loggers using the logging package
/// to reactively stream the log events. Only defines the root logger and
/// the logging appenders infrastructure of the app is kept decoupled from this
/// logging service.
///
/// @author Fredrick Allan Grott.
class ApplicationLogger {
  // to be able to declate a stream enabled listener
  // we need to declare at least one logger first via
  // a string logger name.
  static final Logger _rootLogger = Logger(loggerName);

  // Typical singleton declaration, the factory variation
  // 1. reference set to private instance
  // 2. factory set to reference
  // 3. constructor declared private
  static final _singleton = ApplicationLogger._();
  factory ApplicationLogger() => _singleton;
  ApplicationLogger._();

  static void init(bool isHierarchical) {
    // set the hierarchicalLoggingEnabled if isHierarchical
    // is true which would mean if set true each additional
    // local logger define will label those log events with
    // that local logger name tag. Typical names is the
    // string name of a class, i.e. (YourClass).toString()
    if (isHierarchical) {
      hierarchicalLoggingEnabled = true;
    }

    // Means that the root logger is logging all levels.
    Logger.root.level = Level.ALL;

    // Setting it up to listen to LogRecord events as a stream of messages
    Logger.root.onRecord.listen((LogRecord rec) {
      if (rec.error != null && rec.stackTrace != null) {
        log(
          'level: ${rec.level.name} loggerName: ${rec.loggerName} time: ${rec.time} message: ${rec.message} error: ${rec.error} exception: ${rec.stackTrace}',
        );
      } else if (rec.error != null) {
        log('level: ${rec.level.name} loggerName: ${rec.loggerName} time: ${rec.time} message: ${rec.message} error: ${rec.error}');
      } else {
        log('level: ${rec.level.name} loggerName: ${rec.loggerName} time: ${rec.time} message: ${rec.message}');
      }
    });
  }

  // The call then to the root logger is ApplicationLogger.info(message) for
  // example as opposed the class name loggers which will be the call of
  // classNameLogger.info(message)
  static void finest(
    String tag,
    String mesg,
  ) =>
      _rootLogger.finest('[$tag] $mesg');

  static void finer(
    String tag,
    String mesg,
  ) =>
      _rootLogger.finer('[$tag] $mesg');

  static void fine(
    String tag,
    String mesg,
  ) =>
      _rootLogger.fine('[$tag] $mesg');

  static void config(
    String tag,
    String mesg,
  ) =>
      _rootLogger.config('[$tag] $mesg');

  static void info(
    String tag,
    String mesg,
  ) =>
      _rootLogger.info('[$tag] $mesg');

  static void warning(
    String tag,
    String mesg,
  ) =>
      _rootLogger.warning('[$tag] $mesg');

  static void severe(
    String tag,
    String mesg,
  ) =>
      _rootLogger.severe('[$tag] $mesg');

  static void shout(
    String tag,
    String mesg,
  ) =>
      _rootLogger.shout('[$tag] $mesg');
}
