import 'package:dartz/dartz.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';
import 'package:flutter_starter/l10n/l10n.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late GetSupportedLanguageUseCase useCase;

  setUp(() {
    useCase = GetSupportedLanguageUseCase();
  });

  group('features/settings/domain/usecases/', () {
    test(
        'Should get filter supportedLanguage from localization '
        '& with static data Languages', () async {
      // actual
      final result = await useCase(
        SupportedLanguageParams(
          locales: AppLocalizations.supportedLocales,
          referenceLanguages: LanguagesData.data,
        ),
      );

      // assert
      expect(result, isA<Right<Failure, List<Language>>>());
      expect(
        result.foldRight(0, (r, previous) => r.length),
        AppLocalizations.supportedLocales.length,
      );
    });
  });
}
