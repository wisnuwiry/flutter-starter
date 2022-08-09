import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';

class RecordErrorUseCase {
  FutureOr call(RecordErrorParams params) async {
    // TODO: Implement Logging Error in this body,
    // like Sentry of Firebase Crashlytics http://sentry.io
    log(
      params.reason ?? params.exception.toString(),
      name: 'ERROR',
      stackTrace: params.stackTrace is StackTrace?
          ? params.stackTrace as StackTrace?
          : StackTrace.fromString(params.stackTrace.toString()),
    );
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
