import 'package:get_it/get_it.dart';

import '../core.dart';

final sl = GetIt.instance;

@override
Future<void> init() async {
  // Plugins
  initDioPlugin();
  await initHivePlugin();
  await initFirebasePlugin();

  // Features
  initFigmaFeatures();
  initYoutubeFeatures();
  initGithubFeatures();
}
