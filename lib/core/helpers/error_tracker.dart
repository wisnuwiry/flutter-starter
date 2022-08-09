import 'dart:developer';

class ErrorTracker {
  /// Record any error, and store it to error tracker tool
  static void record(
    Object error,
    StackTrace stackTrace, {
    String? errorTitle,
  }) {
    ErrorTracker()._record(error, stackTrace, errorTitle: errorTitle);
  }

  void _record(Object error, StackTrace stackTrace, {String? errorTitle}) {
    log(
      errorTitle ?? error.toString(),
      error: errorTitle ?? error.toString(),
      stackTrace: stackTrace,
      name: 'ERROR',
    );

    // TODO: Implement Logging Error in this body,
    // like Sentry of Firebase Crashlytics http://sentry.io
  }
}
