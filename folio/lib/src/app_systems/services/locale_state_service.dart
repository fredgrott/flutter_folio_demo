// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:folio/src/app_systems/services/platform_locale_service.dart';



import 'package:folio/src/app_systems/services/supported_locales_service.dart';
import 'package:folio/src/domain/models/locale_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_state_service.g.dart';

@riverpod
class LocaleStateService extends _$LocaleStateService {
  
  

  @override
  LocaleState build() =>  const LocaleState();

  /// Initialize Locale
  /// Can be run at startup to establish the initial local from storage, or the platform
  /// 1. Attempts to restore locale from storage
  /// 2. IF no locale in storage, attempts to set local from the platform settings.
  Future<void> initLocale() async {
    // Attempt to restore from storage
    final bool fromStorageSuccess =
        await ref.read(localeStateServiceProvider.notifier).restoreFromStorage();

    // If storage restore did not work, set from platform
    if (!fromStorageSuccess) {
      ref
          .read(localeStateServiceProvider.notifier)
          .setLocale(ref.read(platformLocaleServiceProvider));
    }
  }

  // ignore: format-comment
  /// Set Locale.
  /// Attempts to set the locale if it's in our list of supported locales.
  /// IF NOT: get the first locale that matches our language code and set that.
  /// ELSE: do nothing.
  void setLocale(Locale locale) {
    final List<Locale> supportedLocales = ref.read(supportedLocalesServiceProvider);

    // Set the locale if it's in our list of supported locales
    if (supportedLocales.contains(locale)) {
      // Update state
      state = state.copyWith(locale: locale);

      // Save to persistence
      state.localSave();

      return;
    }

    // Get the closest language locale and set that instead
    final Locale? closestLocale = supportedLocales.firstWhereOrNull(
      (supportedLocale) => supportedLocale.languageCode == locale.languageCode,
    );
    if (closestLocale != null) {
      // Update state
      state = state.copyWith(locale: closestLocale);

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
      final LocaleState? myState = await state.fromStorage();

      // If user is null, there is no user to restore
      if (myState == null) {
        return false;
      }

      log("State found in storage: ${myState.toJson()}");

      // Set state
      state = myState;

      return true;
    } catch (e, s) {
      log("Error$e");
      log(s.toString());

      return false;
    }
  }

  
}
