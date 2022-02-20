import 'package:flutter/material.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/l10n/l10n.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.dp32,
          horizontal: Dimens.dp16,
        ),
        child: Column(
          children: [
            Text(
              '404',
              style: context.theme.textTheme.headline1?.copyWith(
                color: context.theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            Text(
              context.l10n.pageNotFoundMessage,
              style: context.theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Dimens.dp20),
            ElevatedButton(
              key: const Key('back_to_home_button_not_found'),
              onPressed: () {
                context.go('/');
              },
              child: Text(context.l10n.backToHomeLabel),
            ),
            const SizedBox(height: Dimens.dp20),
            Image.asset(MainAssets.notFoundImg),
          ],
        ),
      ),
    );
  }
}
