import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

import '../core.dart';
import '../network/network.dart';

final sl = GetIt.instance;

@override
Future<void> init() async {
  // Core
  initCore();

  // Plugins
  await initHivePlugin();

  // Features
  initExampleFeatures();
}

void initCore() async {
  sl.registerLazySingleton<Client>(
      () => InterceptedClient.build(interceptors: [CustomInterceptor()]));
}
