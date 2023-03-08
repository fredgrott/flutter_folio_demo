// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';
import 'dart:ui';

import 'package:folio/src/app_systems/json_local_sync.dart';
import 'package:folio/src/domain/models/locale_json_converter.dart';
import 'package:folio/src/domain/models/persistent_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'locale_state.freezed.dart';
part 'locale_state.g.dart';


// Fallback Locale
// ignore: prefer-static-class
const Locale fallbackLocale = Locale('en', 'US',);


@freezed
class LocaleState with _$LocaleState, PersistentState<LocaleState> {
  static const _localStorageKey = 'persistentLocale';


  const factory LocaleState({
    @LocaleJsonConverter() @Default(fallbackLocale) @JsonKey() Locale locale,
  }) = _LocaleState;

  // Allow custom getters / setters
  const LocaleState._();

  // For Riverpod integrated toJson / fromJson json_serializable code generator
  factory LocaleState.fromJson(Map<String, dynamic> json) =>
      _$LocaleStateFromJson(json);

  

  /// Local Save
  /// Saves the settings to persistent storage.
  @override
  Future<bool> localSave() async {
    final Map<String, dynamic> value = toJson();
    try {
      return await JsonLocalSync.save(key: _localStorageKey, value: value,);
    } catch (e) {
      log(e.toString());

      return false;
    }
  }

  /// Local Delete
  /// Deletes the settings from persistent storage.
  @override
  Future<bool> localDelete() async {
    try {
      return await JsonLocalSync.delete(key: _localStorageKey);
    } catch (e) {
      log(e.toString());
      
      return false;
    }
  }

  /// Create the settings from Persistent Storage
  /// (Static Factory Method supports Async reading of storage).
  @override
  Future<LocaleState?> fromStorage() async {
    try {
      final _value = await JsonLocalSync.get(key: _localStorageKey);
      if (_value == null) {
        return null;
      }

      return LocaleState.fromJson(_value); 

    } catch (e) {
      rethrow;
    }
  }

  
}
