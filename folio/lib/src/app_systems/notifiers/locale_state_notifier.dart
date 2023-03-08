// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_dynamic_calls, no_leading_underscores_for_local_identifiers

import 'dart:developer';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:folio/src/app_systems/providers/locale_state_provider.dart';
import 'package:folio/src/app_systems/providers/platform_locale_provider.dart';
import 'package:folio/src/app_systems/providers/supported_locales_provider.dart';
import 'package:folio/src/domain/models/locale_state.dart';

class LocaleStateNotifier extends StateNotifier<LocaleState> {
  // ignore: prefer-correct-identifier-length
  final Ref ref;
  LocaleStateNotifier(this.ref) : super(const LocaleState());

  /// Initialize Locale
  /// Can be run at startup to establish the initial local from storage, or the platform
  /// 1. Attempts to restore locale from storage
  /// 2. IF no locale in storage, attempts to set local from the platform settings.
  Future<void> initLocale() async {
    // Attempt to restore from storage
    final bool _fromStorageSuccess =
        await ref.read(localeStateProvider.notifier).restoreFromStorage();

    // If storage restore did not work, set from platform
    if (!_fromStorageSuccess) {
      ref
          .read(localeStateProvider.notifier)
          .setLocale(ref.read(platformLocaleProvider));
    }
  }

  // ignore: format-comment
  /// Set Locale.
  /// Attempts to set the locale if it's in our list of supported locales.
  /// IF NOT: get the first locale that matches our language code and set that.
  /// ELSE: do nothing.
  void setLocale(Locale locale) {
    final List<Locale> _supportedLocales = ref.read(supportedLocalesProvider);

    // Set the locale if it's in our list of supported locales
    if (_supportedLocales.contains(locale)) {
      // Update state
      state = state.copyWith(locale: locale);

      // Save to persistence
      state.localSave();

      return;
    }

    // Get the closest language locale and set that instead
    final Locale? _closestLocale = _supportedLocales.firstWhereOrNull(
        (supportedLocale) =>
            supportedLocale.languageCode == locale.languageCode,);
    if (_closestLocale != null) {
      // Update state
      state = state.copyWith(locale: _closestLocale);

      // Save to persistence
      state.localSave();

      return;
    }

    // Otherwise, do nothing and we'll stick with the default locale
    return;
  }

  /// Restore Locale from Storage.
  Future<bool> restoreFromStorage() async {
    try {
      log("Restoring LocaleState from storage.");
      // Attempt to get the user from storage
      final LocaleState? _state = await state.fromStorage();

      // If user is null, there is no user to restore
      if (_state == null) {
        return false;
      }

      log("State found in storage: ${_state.toJson()}");

      // Set state
      state = _state;

      return true;
    } catch (e, s) {
      log("Error$e");
      log(s.toString());

      return false;
    }
  }
}
