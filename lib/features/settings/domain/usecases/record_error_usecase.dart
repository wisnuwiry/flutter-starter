import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_starter/core/core.dart';
import 'package:get_it/get_it.dart';

class RecordErrorUseCase
    implements UseCaseFuture<Failure, bool, RecordErrorParams> {
  @override
  FutureOr<Either<Failure, bool>> call(RecordErrorParams params) async {
    // try {
    // TODO(params): Handle send log error in here
    log(
      params.reason ?? params.exception.toString(),
      name: 'ERROR',
      stackTrace: params.stackTrace is StackTrace?
          ? params.stackTrace as StackTrace?
          : StackTrace.fromString(params.stackTrace.toString()),
    );
    return const Right(true);
    // } catch (_) {
    //   return Left(CodeFailure(message: _.toString()));
    // }
  }
}

class RecordErrorParams extends Equatable {
  const RecordErrorParams({
    required this.exception,
    this.stackTrace,
    this.reason,
  });

  final Object exception;
  final Object? stackTrace;
  final String? reason;

  @override
  List<Object?> get props => [exception, stackTrace, reason];
}

extension RecordErrorExtensions on Object {
  void recordError(RecordErrorParams params) {
    GetIt.I<RecordErrorUseCase>()(params);
  }
}
