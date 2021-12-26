import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/domain/domain.dart';

class SaveLanguageSettingUseCase
    implements UseCaseFuture<Failure, bool, Language> {
  SaveLanguageSettingUseCase(this.repository);
  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(Language params) {
    return repository.saveLanguageSetting(params);
  }
}
