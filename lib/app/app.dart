import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

import '../features/settings/settings.dart';
import '../l10n/l10n.dart';
import 'config.dart';
import 'routes.gr.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

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
          create: (context) =>
              GetIt.I<ThemeBloc>()..add(InitializeThemeEvent()),
        ),
        BlocProvider(
          create: (context) =>
              GetIt.I<LanguageBloc>()..add(InitializeLanguageEvent()),
        ),
      ],
      child: _AppWidget(router: _appRouter),
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
              theme: themeState.theme,
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
