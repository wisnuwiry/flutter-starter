import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_starter/l10n/l10n.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLanguageBloc extends MockBloc<LanguageEvent, LanguageState>
    implements LanguageBloc {}

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    MockLanguageBloc? mockLanguageBloc,
    MockThemeBloc? mockThemeBloc,
  }) {
    final _mockLanguageBloc = mockLanguageBloc ?? MockLanguageBloc();
    final _mockThemeBloc = mockThemeBloc ?? MockThemeBloc();

    if (mockThemeBloc == null) {
      when(() => _mockThemeBloc.state).thenReturn(
        const ThemeState(AppTheme.light),
      );
    }

    if (mockLanguageBloc == null) {
      when(() => _mockLanguageBloc.state)
          .thenReturn(const LanguageState(null, []));
    }

    return pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<LanguageBloc>(
            lazy: false,
            create: (_) => _mockLanguageBloc,
          ),
          BlocProvider<ThemeBloc>(
            lazy: false,
            create: (_) => _mockThemeBloc,
          ),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: MediaQuery(
            data: const MediaQueryData(),
            child: widget,
          ),
        ),
      ),
    );
  }
}
