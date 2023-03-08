// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:ui';
import 'package:json_annotation/json_annotation.dart';


/// Locale Json Converter
/// Locale does not come with toJson / fromJson functions, so we
/// use these overrides to work with freezed / json_serializable.
class LocaleJsonConverter implements JsonConverter<Locale, String> {
  const LocaleJsonConverter();

  @override
  Locale fromJson(String json) {
    final Map<String, dynamic> jsonLocale = jsonDecode(json)  as Map<String, dynamic>;
    
    return Locale.fromSubtags(
        languageCode: jsonLocale['languageCode'] as String,
        countryCode: jsonLocale['countryCode'] as String,);
  }

  @override
  String toJson(Locale locale) {
    return jsonEncode({
      'languageCode': locale.languageCode,
      'countryCode': locale.countryCode,
    });
  }
}
