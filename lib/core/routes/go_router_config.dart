import 'package:go_router/go_router.dart';
import 'package:personal_website/core/routes/route_names.dart';

import '../../lib.dart';

final goRouter = GoRouter(
  redirect: (context, state) {
    final path = state.uri.queryParameters['path'];
    if (path != null && path.isNotEmpty) {
      return '/$path';
    }
    return null;
  },
  errorBuilder: (context, state) => const NotFoundPage(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: routeMap.entries
          .map((entry) => GoRoute(
                path: entry.key,
                builder: (context, state) => entry.value,
              ))
          .toList(),
    ),
  ],
);
