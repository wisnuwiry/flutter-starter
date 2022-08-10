import 'dart:developer';

extension RecordErrorExtensions on Object {
  void recordError({
    Object? exception,
    Object? stackTrace,
    String? reason,
  }) {
    // TODO: Implement Logging Error in this body,
    // like Sentry of Firebase Crashlytics http://sentry.io
    log(
      reason ?? exception.toString(),
      name: 'ERROR',
      stackTrace: stackTrace is StackTrace?
          ? stackTrace
          : StackTrace.fromString(stackTrace.toString()),
    );
  }
}
