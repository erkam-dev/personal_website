import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/core/core.dart';

import 'app/app_config.dart';

void main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) =>
      Text(kDebugMode ? details.toString() : "Something Went Wrong!")
          .centerWidget()
          .pad16()
          .card();
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}
