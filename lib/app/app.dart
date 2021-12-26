import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_starter/app/config.dart';
import 'package:flutter_starter/app/routes.gr.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_starter/l10n/l10n.dart';
import 'package:get_it/get_it.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();
final _router = AppRouter(globalNavigatorKey);

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:
            AppConfig.transparentStatusBar ? Colors.transparent : null,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I<ThemeBloc>()..add(const ThemeStarted()),
        ),
        BlocProvider(
          create: (context) =>
              GetIt.I<LanguageBloc>()..add(const LanguageStarted()),
        ),
      ],
      child: _AppWidget(router: _router),
    );
  }
}

class _AppWidget extends StatelessWidget {
  const _AppWidget({Key? key, required this.router}) : super(key: key);

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, languageState) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp.router(
              title: AppConfig.titleSiteWeb,
              theme: themeState.theme.toThemeData(),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],
              locale: languageState.language != null
                  ? Locale(languageState.language!.code)
                  : null,
              debugShowCheckedModeBanner: false,
              supportedLocales: AppLocalizations.supportedLocales,
              routerDelegate: router.delegate(),
              routeInformationParser: router.defaultRouteParser(),
            );
          },
        );
      },
    );
  }
}
