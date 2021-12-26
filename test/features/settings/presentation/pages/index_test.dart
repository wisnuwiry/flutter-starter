import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/app/config.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/pump_app.dart';

void main() {
  group('features/settings/presentation/pages/', () {
    testWidgets('Renders Settings Page', (tester) async {
      await tester.pumpApp(const SettingsPage());

      // Check widget is available or not
      expect(find.text('Settings'), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(2));
    });

    testWidgets('Should open dialog theme settings', (tester) async {
      await tester.pumpApp(const SettingsPage());

      // Check dialog is not shown
      expect(find.byType(SimpleDialog), findsNothing);

      // showDialog
      final themeListTile =
          find.byKey(const Key('list_tile_settings_select_theme'));
      expect(themeListTile, findsOneWidget);

      await tester.tap(themeListTile);
      await tester.pumpAndSettle();

      // Check dialog is shown
      expect(find.byType(SimpleDialog), findsOneWidget);

      // Check Theme Menu is same length with AppTheme.values
      const settingsMenuListTile = 2;
      expect(
        find.byType(ListTile),
        findsNWidgets(settingsMenuListTile + AppTheme.values.length),
      );
    });

    testWidgets('Should open dialog language settings', (tester) async {
      // arrange
      final mockLanguageBloc = MockLanguageBloc();
      const supportedLanguage = [
        Language(code: 'id', name: 'Indonesia'),
        Language(code: 'en', name: 'English')
      ];

      // Mock state language
      when(() => mockLanguageBloc.state).thenReturn(
        LanguageState(supportedLanguage.first, supportedLanguage),
      );

      await tester.pumpApp(
        const SettingsPage(),
        mockLanguageBloc: mockLanguageBloc,
      );

      // Check dialog is not shown
      expect(find.byType(SimpleDialog), findsNothing);

      // Check default language code is [supportedLanguage.first]
      expect(find.text(supportedLanguage.first.code), findsOneWidget);

      // showDialog
      final themeListTile =
          find.byKey(const Key('list_tile_settings_select_language'));
      expect(themeListTile, findsOneWidget);

      await tester.tap(themeListTile);
      await tester.pumpAndSettle();

      // Check dialog is shown
      expect(find.byType(SimpleDialog), findsOneWidget);

      // Validate supported language list is correctly
      const settingsMenuListTile = 2;
      expect(
        find.byType(ListTile),
        findsNWidgets(settingsMenuListTile + supportedLanguage.length),
      );
    });

    testWidgets('Should change theme from light to dark correctly',
        (tester) async {
      // arrange
      final mockThemeBloc = MockThemeBloc();

      // Mock state language
      when(() => mockThemeBloc.state).thenReturn(
        const ThemeState(AppConfig.defaultTheme),
      );

      whenListen(
        mockThemeBloc,
        Stream<ThemeState>.fromIterable(const [ThemeState(AppTheme.dark)]),
      );

      await tester.pumpApp(
        const SettingsPage(),
        mockThemeBloc: mockThemeBloc,
      );

      // Check dialog is not shown
      expect(find.byType(SimpleDialog), findsNothing);

      // showDialog
      final themeListTile =
          find.byKey(const Key('list_tile_settings_select_theme'));
      expect(themeListTile, findsOneWidget);

      await tester.tap(themeListTile);
      await tester.pumpAndSettle();

      // Tap change theme dark
      final darkItem = find.text(AppTheme.dark.toText());
      await tester.tap(darkItem);

      verify(() => mockThemeBloc.add(const ThemeChanged(AppTheme.dark)))
          .called(1);
    });

    testWidgets('Should change language settings correcty', (tester) async {
      // arrange
      final mockLanguageBloc = MockLanguageBloc();
      const supportedLanguage = [
        Language(code: 'id', name: 'Indonesia'),
        Language(code: 'en', name: 'English')
      ];

      // Mock state language
      when(() => mockLanguageBloc.state).thenReturn(
        LanguageState(supportedLanguage.first, supportedLanguage),
      );

      await tester.pumpApp(
        const SettingsPage(),
        mockLanguageBloc: mockLanguageBloc,
      );

      // showDialog
      final themeListTile =
          find.byKey(const Key('list_tile_settings_select_language'));
      expect(themeListTile, findsOneWidget);

      await tester.tap(themeListTile);
      await tester.pumpAndSettle();

      // Check dialog is shown
      expect(find.byType(SimpleDialog), findsOneWidget);

      // Tap change language to english
      final newLanguage = supportedLanguage.last;
      final englishLanguage = find.text(newLanguage.name);
      await tester.tap(englishLanguage);

      verify(() => mockLanguageBloc.add(LanguageChanged(newLanguage)))
          .called(1);
    });
  });
}
