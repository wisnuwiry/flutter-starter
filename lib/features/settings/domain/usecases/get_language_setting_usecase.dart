import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class GetLanguageSettingUseCase
    implements UseCaseFuture<Failure, Language, NoParams> {
  GetLanguageSettingUseCase(this.repository);
  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, Language>> call(NoParams params) {
    return repository.getLanguageSetting();
  }
}
