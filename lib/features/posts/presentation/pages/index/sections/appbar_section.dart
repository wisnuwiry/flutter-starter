import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppBarSection extends AppBar {
  AppBarSection(this.context, {Key? key})
      : super(
          title: const Text('Post Page'),
          actions: _actions,
          bottom: _buildTabs(context),
          key: key,
        );

  final BuildContext context;

  static final List<Widget> _actions = [
    IconButton(
      icon: const Icon(Icons.exit_to_app),
      onPressed: () {},
    ),
  ];

  static PreferredSizeWidget _buildTabs(BuildContext context) {
    return TabBar(
      onTap: (index) {
        switch (index) {
          case 1:
            context.router.pushNamed('/example-not-found-route');
            break;
          case 2:
            context.router.pushNamed('/settings');
            // Push with Route Class
            // context.router.push(const SettingsRoute());
            break;
          default:
        }
      },
      tabs: const [
        Tab(text: 'Posts', icon: Icon(Icons.article)),
        Tab(text: 'Not Found Page', icon: Icon(Icons.bug_report)),
        Tab(text: 'Settings Page', icon: Icon(Icons.settings)),
      ],
    );
  }
}
