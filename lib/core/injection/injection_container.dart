import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get_it/get_it.dart';

import '../core.dart';

final sl = GetIt.instance;

@override
Future<void> init() async {
  // Plugins
  initDioPlugin();
  await initHivePlugin();
  await initFirebasePlugin();
  setUrlStrategy(PathUrlStrategy());

  // Features
  initFigmaFeatures();
  initYoutubeFeatures();
  initGithubFeatures();
}
