/// Constants used throughout the Slidee App
class AppConstants {
  // App information
  static const String appName = 'Slidee';
  static const String appVersion = '1.0.0';

  // Asset paths
  static const String logoPath =
      'assets/images/logo.png'; // Placeholder for logo

  // Animation durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 350);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);

  // API endpoints (placeholder for future implementation)
  static const String baseApiUrl = 'https://api.slidee.app';

  // Navigation routes
  static const String homeRoute = '/';
  static const String feedRoute = '/feed';
  static const String profileRoute = '/profile';
  static const String settingsRoute = '/settings';
  static const String createPostRoute = '/create-post';

  // Shared preferences keys
  static const String themePreferenceKey = 'theme_preference';
  static const String userTokenKey = 'user_token';

  // Default values
  static const int defaultPageSize = 20;
  static const double defaultAvatarSize = 40.0;
  static const double defaultIconSize = 24.0;

  // Feature flags
  static const bool enableDarkMode = true;
  static const bool enableNotifications = true;
}
