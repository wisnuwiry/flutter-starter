import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/home/home.dart';
import 'package:flutter_starter/features/settings/settings.dart';

// @CupertinoAutoRouter
// @MaterialAutoRouter
// @CustomAutoRouter
@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute<Widget>(page: SettingsPage, path: '/settings'),
    AutoRoute<Widget>(page: MainPage, path: '/', initial: true),
    AutoRoute<Widget>(path: '*', page: NotFoundPage),
  ],
)
class $AppRouter {}
