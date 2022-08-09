import 'package:flutter_starter/features/settings/settings.dart';
import 'package:get_it/get_it.dart';

extension RecordErrorExtensions on Object {
  void recordError({
    Object? exception,
    Object? stackTrace,
    String? reason,
  }) {
    GetIt.I<RecordErrorUseCase>()(
      RecordErrorParams(
        exception: exception ?? this,
        stackTrace: stackTrace,
        reason: reason,
      ),
    );
  }
}
