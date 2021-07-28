import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/core.dart';

class GetSupportedLanguageUseCase
    implements UseCaseFuture<Failure, List<Language>, SupportedLanguageParams> {
  @override
  FutureOr<Either<Failure, List<Language>>> call(
      SupportedLanguageParams params) async {
    final _currentSupportedLangCode = <String>[];
    final _result = <Language>[];

    for (var item in params.locales) {
      _currentSupportedLangCode.add(item.languageCode);
    }

    for (var item in params.referenceLanguages) {
      if (_currentSupportedLangCode.contains(item.code)) {
        _result.add(item);
      }
    }

    return Right(_result.toSet().toList());
  }
}

class SupportedLanguageParams {
  SupportedLanguageParams(
      {required this.referenceLanguages, required this.locales});

  final List<Language> referenceLanguages;
  final List<Locale> locales;
}
