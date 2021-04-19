import '../core/core.dart';

/// Base Config in App
class AppConfig {
  // ---------------------------------------------------------------------------
  //                               CORE CONFIG                                \\
  // ---------------------------------------------------------------------------

  /// Title Apps in Browser Tab
  ///
  /// This config set `title` in `MaterialApp`
  /// And by default title in `MaterialApp` change
  /// title in Tab Browser on your web apps
  static const String titleSiteWeb = 'Flutter Works';

  /// Base URL API Apps
  /// Base URL in Production Mode
  static const String baseURL = 'https://api.stackexchange.com/2.2';

  /// Base URL in Development Mode
  static const String baseURLDev = 'https://api.stackexchange.com/2.2';

  /// Base URL in Staging Mode
  static const String baseURLStg = 'https://api.stackexchange.com/2.2';

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
