import 'package:adaptive_scaffold_setup/application/app_loggers.dart';
import 'package:adaptive_scaffold_setup/application/asset_list.dart';
import 'package:adaptive_scaffold_setup/application/init_logging.dart';
import 'package:adaptive_scaffold_setup/my_app.dart';
import 'package:flutter/material.dart';

import 'package:url_strategy/url_strategy.dart';


void main() {
  // anything before the runApp method call needs this as this
  // what is called first in the runApp method. Leter on we
  // use it to get a callback once first freme is ready to
  // load an asset cache. See [WidgetsFlutterBinding]
  final appBinding = WidgetsFlutterBinding.ensureInitialized();

  InitLogging();
  appLogger.info('initialized');

  // Cache images in assets folder via using the Flutter Engine binding
  // lifecycle. Google Fonts package has it's own cache impl similar
  // to this. Localization initialization is similar in impl but
  // declared in the shared scaffold stateful widget instead.
  appBinding.deferFirstFrame();
  appBinding.addPostFrameCallback((_) {
    final Element? context = appBinding.rootElement;
    if (context != null) {
      for (final asset in assetList) {
        precacheImage(
          AssetImage(asset),
          context,
        );
      }
    }
    appBinding.allowFirstFrame();
  });

  // on web sets not hash, on other platforms is a NOOP
  setPathUrlStrategy();



  runApp(const MyApp());
}
