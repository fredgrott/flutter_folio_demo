// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/app_systems/providers/scaffold_messenger_key_pod.dart';

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
final scaffoldMessengerPod = Provider((ref) {
  return ref.watch(scaffoldMessengerKeyPod).currentState!;
});
