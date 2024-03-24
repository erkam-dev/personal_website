import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_website/app/portfolio/presentation/screens/decisionai_portfolio_screen.dart';
import 'package:personal_website/app/portfolio/presentation/screens/tg_portfolio_screen.dart';

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
          path: 'portfolio/ticktodo/help',
          builder: (context, state) => const Scaffold(),
        ),
      ],
    ),
  ],
);
