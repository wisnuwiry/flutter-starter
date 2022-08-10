import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_starter/core/core.dart';
import 'package:flutter_starter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

/// Login Usecase
class LoginUseCase implements UseCaseFuture<ErrorException, User, LoginParams> {
  const LoginUseCase(this.repository);

  final AuthRepository repository;

  @override
  FutureOr<Either<ErrorException, User>> call(LoginParams params) async {
    try {
      return Right(await repository.login(params.toBody()));
    } on ErrorException catch (exception) {
      return Left(exception);
    }
  }
}

/// Login param argument for [LoginUseCase]
///
/// - [email] a String user email can be logged in
/// - [password] a String key of account
class LoginParams extends Equatable {
  const LoginParams({required this.email, required this.password});

  final String email;
  final String password;

  Map<String, dynamic> toBody() => <String, dynamic>{
        'email': email,
        'password': password,
      };

  @override
  List<Object?> get props => [email, password];
}
