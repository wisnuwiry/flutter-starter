part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();
}

class LanguageStarted extends LanguageEvent {
  const LanguageStarted();

  @override
  List<Object> get props => [];
}

class LanguageChanged extends LanguageEvent {
  const LanguageChanged(this.language);

  final Language language;

  @override
  List<Object> get props => [language];
}
