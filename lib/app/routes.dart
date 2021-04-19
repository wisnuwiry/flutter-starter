import 'package:auto_route/auto_route.dart';

import '../core/core.dart';
import '../features/posts/posts.dart';
import '../features/settings/settings.dart';

// @CupertinoAutoRouter
// @MaterialAutoRouter
// @CustomAutoRouter
@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: PostsPage, initial: true),
    AutoRoute(page: SettingsPage, path: '/settings'),
    AutoRoute(path: '*', page: NotFoundPage),
  ],
)
class $AppRouter {}
