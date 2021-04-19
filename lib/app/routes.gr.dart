// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter_works/core/core.dart' as _i4;
import 'package:flutter_works/features/posts/posts.dart' as _i2;
import 'package:flutter_works/features/settings/settings.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    PostsRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: const _i2.PostsPage());
    },
    SettingsRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: const _i3.SettingsPage());
    },
    NotFoundRoute.name: (entry) {
      return _i1.AdaptivePage(entry: entry, child: const _i4.NotFoundPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(PostsRoute.name, path: '/'),
        _i1.RouteConfig(SettingsRoute.name, path: '/settings'),
        _i1.RouteConfig(NotFoundRoute.name, path: '*')
      ];
}

class PostsRoute extends _i1.PageRouteInfo {
  const PostsRoute() : super(name, path: '/');

  static const String name = 'PostsRoute';
}

class SettingsRoute extends _i1.PageRouteInfo {
  const SettingsRoute() : super(name, path: '/settings');

  static const String name = 'SettingsRoute';
}

class NotFoundRoute extends _i1.PageRouteInfo {
  const NotFoundRoute() : super(name, path: '*');

  static const String name = 'NotFoundRoute';
}
