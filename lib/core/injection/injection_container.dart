import 'package:get_it/get_it.dart';
import 'package:url_strategy/url_strategy.dart';

import '../core.dart';

final sl = GetIt.instance;

@override
Future<void> init() async {
  // Plugins
  initDioPlugin();
  await initHivePlugin();
  await initFirebasePlugin();
  setPathUrlStrategy();

  // Features
  initFigmaFeatures();
  initYoutubeFeatures();
  initGithubFeatures();
}
