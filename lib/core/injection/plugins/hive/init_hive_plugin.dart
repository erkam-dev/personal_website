import 'package:hive_flutter/hive_flutter.dart';

import '../../../core.dart';

const String exampleKey = "example";

Future<void> initHivePlugin() async {
  await Hive.initFlutter();
  Box<String> exampleBox = await Hive.openBox<String>(exampleKey);
  sl.registerLazySingleton<Box<String>>(
    () => exampleBox,
    instanceName: exampleKey,
  );
}
