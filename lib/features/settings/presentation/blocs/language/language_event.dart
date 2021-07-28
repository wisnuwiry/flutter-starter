part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class InitializeLanguageEvent extends LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent {
  const ChangeLanguageEvent(this.language);

  final Language language;

  @override
  List<Object> get props => [language];
}
