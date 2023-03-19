// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider used to access the AppLocalizations object for the current locale.
/// In order to get to rebuild upon a locale change I need to supply an
/// Observer that is bound to the WidgetsBindingObserver so that we 
/// can do localizations without needing the context. Its usage is then
///
/// ```dart
/// final loc = ref.read(appLocalizationsProvider);
/// final error = loc.addToCartFailed;
/// ```
/// 
/// author Fredrick Allan Grott.
final localizationsServiceProvider = Provider<AppLocalizations>((ref) {
  // 1. initialize from the initial locale
  ref.state = lookupAppLocalizations(ui.window.locale);
  // 2. create an observer to update the state
  final observer = _LocaleObserver((locales) {
    ref.state = lookupAppLocalizations(ui.window.locale);
  });
  // 3. register the observer and dispose it when no longer needed
  final binding = WidgetsBinding.instance;
  binding.addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));
  // 4. return the state

  return ref.state;
});

/// Observer used to notify the caller when the locale changes.
class _LocaleObserver extends WidgetsBindingObserver {
  final void Function(List<Locale>? locales) _didChangeLocales;

  _LocaleObserver(this._didChangeLocales);

  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}
