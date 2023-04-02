// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:url_launcher/url_launcher.dart';



class WebFunctions {
  WebFunctions._();

  static Future<void> appLaunchUrl(String nonParsed) async {
    final Uri siteUrl = Uri.parse(nonParsed);

    if (!await launchUrl(siteUrl)) {
      throw Exception("Could not launch");
    }
  }

  

  
}
