import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:personal_website/core/core.dart';
import 'package:personal_website/firebase_options.dart';

initFirebasePlugin() async {
  // Setups
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseRemoteConfig remoteConfig = await FirebaseRemoteConfig.instance;
  FirebaseAnalytics analytics = await FirebaseAnalytics.instance;
  sl.registerLazySingleton<FirebaseRemoteConfig>(() => remoteConfig);
  sl.registerLazySingleton<FirebaseAnalytics>(() => analytics);
  // Remote Config
  sl<FirebaseRemoteConfig>().ensureInitialized();
  sl<FirebaseRemoteConfig>().setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));
  sl<FirebaseRemoteConfig>().setDefaults(remoteConfigDefaults);
  sl<FirebaseRemoteConfig>().fetchAndActivate();
  ;
}
