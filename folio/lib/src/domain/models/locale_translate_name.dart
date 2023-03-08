// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:ui';

// ignore: prefer-static-class
String translateLocaleName({required Locale locale}) {
  switch (locale.toLanguageTag()) {
    case "de-DE":
      {
        return "Deutsch";
      }
    case "en-US":
      {
        return "English";
      }
    case "es-ES":
      {
        return "EspaÃ±ol";
      }
    case "fr-FR":
      {
        return "FranÃ§ais";
      }
    case "it-IT":
      {
        return "Italiano";
      }
    case "ja-JP":
      {
        return "æ—¥æœ¬èªž";
      }
    case "ko-KR":
      {
        return "í•œêµ­ì–´";
      }
    case "pt-BR":
      {
        return "PortuguÃªs";
      }
    default:
      {
        return "N/A";
      }
  }
}
