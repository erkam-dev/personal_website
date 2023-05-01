import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/app/app.dart';
import 'package:personal_website/core/core.dart';
import 'package:personal_website/features/figma/figma.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<FigmaBloc>())],
      child: ValueListenableBuilder(
        valueListenable: themeMode,
        builder: (context, value, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: const CupertinoScrollBehavior(),
          themeMode: value,
          navigatorKey: NavigationService.navigatorKey,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
