import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/settings/domain/domain.dart';

class SaveThemeSettingUseCase
    implements UseCaseFuture<Failure, bool, AppTheme> {
  SaveThemeSettingUseCase(this.repository);
  final SettingsRepository repository;

  @override
  FutureOr<Either<Failure, bool>> call(AppTheme params) {
    return repository.saveThemeSetting(params);
  }
}
