import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_starter/app/flavor.dart';
import 'package:flutter_starter/core/core.dart';

/// Base Config in App
class AppConfig {
  // ---------------------------------------------------------------------------
  //                               CORE CONFIG                                \\
  // ---------------------------------------------------------------------------

  /// This config for:
  /// - Title App in Browser Tab
  /// - Title App in Recent Apps on Android & iOS
  ///
  /// And by default title in `MaterialApp` change
  static const String appName = 'Flutter Starter';

  /// Base URL API App
  static FlavorConfig<String> baseUrl = FlavorConfig<String>(
    /// Base URL in Production Mode
    prod: dotenv.get('BASE_URL_PROD'),

    /// Base URL in Development Mode
    dev: dotenv.get('BASE_URL_DEV'),

    /// Base URL in Staging Mode
    staging: dotenv.get('BASE_URL_STG'),
  );

  // ---------------------------------------------------------------------------
  //                              END CORE CONFIG                             \\
  // ---------------------------------------------------------------------------

  /// Default theme before user change theme
  ///
  /// If the user changes the theme in the app,
  /// the theme will be adjusted according to the user's choice.
  /// And the app's theme is stored in the device cache.
  /// When the user opens the application
  /// then the theme will be set according to the saved theme
  static const AppTheme defaultTheme = AppTheme.light;

  /// Global `stringify` setting for all `Equatable` instances.
  ///
  /// If `stringify` is overridden for a particular `Equatable` instance,
  /// then the local `stringify` value takes precedence
  /// over `AppConfig.stringify`.
  ///
  /// This value defaults to true in debug mode and false in release mode.
  static const bool autoStringifyEquatable = true;

  /// Make overlay statusbar in Android transparent,
  ///
  /// When use `AppBar` background `statusbar` is background `AppBar`
  static const bool transparentStatusBar = true;
}

/// Config multiple flavors
class FlavorConfig<T> {
  const FlavorConfig({
    required this.dev,
    required this.prod,
    required this.staging,
    this.fallback,
  }) : assert(
          // ignore: avoid_bool_literals_in_conditional_expressions
          dev == null || prod == null || staging == null
              ? fallback != null
              : true,
          '[fallback]cannot be null if there is one flavor whose value is null',
        );

  final T? dev;
  final T? prod;
  final T? staging;
  final T? fallback;

  T get value {
    switch (F.flavor) {
      case Flavor.dev:
        return dev ?? fallback!;
      case Flavor.staging:
        return staging ?? fallback!;
      case Flavor.prod:
        return prod ?? fallback!;
    }
  }
}
