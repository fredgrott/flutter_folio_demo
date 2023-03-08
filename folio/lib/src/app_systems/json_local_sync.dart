// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

// ignore: avoid_classes_with_only_static_members
/// JSON Local Sync
/// Save and Get a Json [Map<String, dynamic>] from local persistent storage.
class JsonLocalSync {
  /// Save a Json object to local persistent storage.
  static Future<bool> save(
      {required String key, required Map<String, dynamic> value,}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String jsonString = json.encode(value);

    return prefs.setString(key, jsonString,);
  }

  /// Get a Json object from local persistent storage.
  static Future<Map<String, dynamic>?> get({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(key)) {
      return null;
    }

    final String? jsonString = prefs.getString(key);
    if (jsonString == null) {
      log('Unable to getString for key: "$key".');

      return null;
    }

    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  static Future<bool> delete({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    return prefs.remove(key);
  }
}
