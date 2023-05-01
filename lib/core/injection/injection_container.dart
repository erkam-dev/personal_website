import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

import '../core.dart';
import '../network/network.dart';
import 'features/init_figma_features.dart';

final sl = GetIt.instance;

@override
Future<void> init() async {
  // Core
  initCore();

  // Plugins
  await initHivePlugin();

  // Features
  initFigmaFeatures();
  initExampleFeatures();
}

void initCore() async {
  sl.registerLazySingleton<DotEnv>(() => DotEnv());
  await sl<DotEnv>().load();
  sl.registerLazySingleton<Client>(
      () => InterceptedClient.build(interceptors: [CustomInterceptor()]));
}
