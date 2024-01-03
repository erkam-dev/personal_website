import 'package:get_it/get_it.dart';
import 'package:personal_website/core/injection/plugins/init_dio_plugin.dart';

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
  // initExampleFeatures();
}

// //TODO: migrate to Dio package
// initCore() async => sl.registerLazySingleton<Client>(
//     () => InterceptedClient.build(interceptors: [CustomInterceptor()]));
