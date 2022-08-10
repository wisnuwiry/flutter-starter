import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/features/home/home.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  const AppRouter._();

  static final navigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    routes: <GoRoute>[
      // Home Module
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
    ],
    errorBuilder: (context, state) {
      return Text('Error Page : ${state.error}');
    },
    urlPathStrategy: UrlPathStrategy.path,
    debugLogDiagnostics: kDebugMode,
  );
}
