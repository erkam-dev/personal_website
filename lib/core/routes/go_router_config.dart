import 'package:go_router/go_router.dart';

import '../../lib.dart';

final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'portfolio/decision-ai',
          builder: (context, state) => const DecisionaiPortfolioScreen(),
        ),
        GoRoute(
          path: 'portfolio/teklifimgelsin',
          builder: (context, state) => const TgPortfolioScreen(),
        ),
        GoRoute(
          path: 'portfolio/ticktodo',
          builder: (context, state) => const TickTodoPortfolioScreen(),
        ),
        GoRoute(
          path: '*',
          builder: (context, state) => const NotFoundPage(),
        ),
      ],
    ),
  ],
);
