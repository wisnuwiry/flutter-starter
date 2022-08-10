import 'dart:async';

import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class LogoutUseCase implements UseCaseFuture<ErrorException, bool, NoParams> {
  const LogoutUseCase(this.repository);

  final AuthRepository repository;

  @override
  FutureOr<Either<ErrorException, bool>> call(NoParams params) async {
    try {
      return Right(await repository.logout());
    } on ErrorException catch (error) {
      return Left(error);
    }
  }
}
