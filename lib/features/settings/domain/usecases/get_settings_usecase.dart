import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../domain.dart';

class GetSettingsUseCase implements UseCaseFuture<Failure, Settings, NoParams> {
  GetSettingsUseCase(this.repository);
  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, Settings>> call(NoParams params) {
    return repository.getSettings();
  }
}
