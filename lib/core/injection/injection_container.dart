import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

import '../core.dart';

final sl = GetIt.instance;

@override
Future<void> init() async {
  // Core
  await initCore();

  // Plugins
  await initHivePlugin();
  await initFirebasePlugin();

  // Features
  initFigmaFeatures();
  initYoutubeFeatures();
  // initExampleFeatures();
}

//TODO: migrate to Dio package
initCore() async => sl.registerLazySingleton<Client>(
    () => InterceptedClient.build(interceptors: [CustomInterceptor()]));
