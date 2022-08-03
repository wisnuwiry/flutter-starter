import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_starter/app/config.dart';
import 'package:flutter_starter/app/routes.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_starter/l10n/l10n.dart';
import 'package:get_it/get_it.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

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
      child: const _AppView(),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, languageState) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, themeState) {
            return MaterialApp.router(
              title: AppConfig.appName,
              theme: themeState.theme.toTheme().data,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              locale: languageState.language != null
                  ? Locale(languageState.language!.code)
                  : null,
              debugShowCheckedModeBanner: false,
              supportedLocales: AppLocalizations.supportedLocales,
              routerDelegate: AppRouter.router.routerDelegate,
              routeInformationProvider:
                  AppRouter.router.routeInformationProvider,
              routeInformationParser: AppRouter.router.routeInformationParser,
            );
          },
        );
      },
    );
  }
}
