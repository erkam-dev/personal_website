import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_website/core/core.dart';

import '../features/features.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<FigmaBloc>()),
        BlocProvider(create: (context) => sl<YoutubeBloc>()),
        BlocProvider(create: (context) => sl<GithubBloc>()),
      ],
      child: ValueListenableBuilder(
        valueListenable: themeMode,
        builder: (context, value, child) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          scrollBehavior: const CupertinoScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
            scrollbars: false,
          ),
          title: "Erkam Dev",
          themeMode: ThemeMode.light,
          theme: lightTheme(),
          darkTheme: darkTheme(),
          routerConfig: goRouter,
        ),
      ),
    );
  }
}
