// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter_starter/core/core.dart' as _i3;
import 'package:flutter_starter/features/home/home.dart' as _i2;
import 'package:flutter_starter/features/settings/settings.dart' as _i1;
import 'package:flutter/material.dart' as _i5;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SettingsRoute.name: (routeData) {
      return _i4.AdaptivePage<_i5.Widget>(
          routeData: routeData, child: const _i1.SettingsPage());
    },
    MainRoute.name: (routeData) {
      return _i4.AdaptivePage<_i5.Widget>(
          routeData: routeData, child: const _i2.MainPage());
    },
    NotFoundRoute.name: (routeData) {
      return _i4.AdaptivePage<_i5.Widget>(
          routeData: routeData, child: const _i3.NotFoundPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SettingsRoute.name, path: '/settings'),
        _i4.RouteConfig(MainRoute.name, path: '/'),
        _i4.RouteConfig(NotFoundRoute.name, path: '*')
      ];
}

/// generated route for
/// [_i1.SettingsPage]
class SettingsRoute extends _i4.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i4.PageRouteInfo<void> {
  const MainRoute() : super(MainRoute.name, path: '/');

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.NotFoundPage]
class NotFoundRoute extends _i4.PageRouteInfo<void> {
  const NotFoundRoute() : super(NotFoundRoute.name, path: '*');

  static const String name = 'NotFoundRoute';
}
