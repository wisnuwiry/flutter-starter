import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/settings.dart';

class GetSettingsUseCase implements UseCaseFuture<Failure, Settings, NoParams> {
  GetSettingsUseCase(this.repository);
  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, Settings>> call(NoParams params) {
    return repository.getSettings();
  }
}
