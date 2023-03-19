// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A provider whose value is the global scaffold messenger key passed to
/// [MaterialApp].
///
// ignore: prefer-static-class
final scaffoldMessengerKeyServicePod = Provider((ref) {
  return GlobalKey<ScaffoldMessengerState>();
});

/// Returns the scaffold messenger associated with [scaffoldMessengerKeyPod].
/// And the call will be:
/// ```
/// final scaffoldMessenger = ref.read(scaffoldMessengerPod);
///
///scaffoldMessenger.showSnackBar(
///  SnackBar(
///    content: Text('Some message'),
///  ),
///);
/// ```
///
/// @author Fredrick Allan Grott.
// ignore: prefer-static-class
final scaffoldMessengerServicePod = Provider((ref) {
  return ref.watch(scaffoldMessengerKeyServicePod).currentState!;
});
