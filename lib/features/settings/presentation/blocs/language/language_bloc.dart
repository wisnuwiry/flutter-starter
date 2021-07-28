import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/core.dart';
import '../../../../../l10n/l10n.dart';
import '../../../domain/domain.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc({
    required this.getLanguageSetting,
    required this.saveLanguageSetting,
    required this.getSupportedLanguage,
  }) : super(const LanguageState(null, []));

  final GetLanguageSettingUseCase getLanguageSetting;
  final SaveLanguageSettingUseCase saveLanguageSetting;
  final GetSupportedLanguageUseCase getSupportedLanguage;

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is InitializeLanguageEvent) {
      final savedData = await getLanguageSetting(NoParams());
      final languages = await _getSupportedLanguages();

      yield state.copyWith(
        supportedLanguages: languages,
      );

      yield* savedData.fold((failure) async* {}, (data) async* {
        yield state.copyWith(
          language: data,
          supportedLanguages: languages,
        );
      });
    } else if (event is ChangeLanguageEvent) {
      final result = await saveLanguageSetting(event.language);

      if (result.isRight()) {
        add(InitializeLanguageEvent());
      }
    }
  }

  Future<List<Language>> _getSupportedLanguages() async {
    final result = await getSupportedLanguage(SupportedLanguageParams(
      locales: AppLocalizations.supportedLocales,
      referenceLanguages: LanguagesData.data,
    ));

    return result.getOrElse(() => []);
  }
}
