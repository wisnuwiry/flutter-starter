import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import '../core.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
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
              onPressed: () {
                context.router.popUntilRoot();
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
