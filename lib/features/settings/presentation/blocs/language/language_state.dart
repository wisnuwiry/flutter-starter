part of 'language_bloc.dart';

class LanguageState extends Equatable {
  const LanguageState(this.language, this.supportedLanguages);

  final Language? language;
  final List<Language> supportedLanguages;

  LanguageState copyWith({
    Language? language,
    List<Language>? supportedLanguages,
  }) {
    return LanguageState(
      language ?? this.language,
      supportedLanguages ?? this.supportedLanguages,
    );
  }

  @override
  List<Object?> get props => [language, supportedLanguages];
}
