import 'package:flutter/material.dart';
import 'package:personal_website/core/core.dart';

import 'app/app_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const App());
}
