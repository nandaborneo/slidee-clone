import 'package:flutter/material.dart';

/// Utility class for responsive design
class ResponsiveUtils {
  /// Screen size breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  /// Check if the current screen size is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreakpoint;
  }

  /// Check if the current screen size is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreakpoint && width < tabletBreakpoint;
  }

  /// Check if the current screen size is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }

  /// Get responsive value based on screen size
  static T getResponsiveValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    final width = MediaQuery.of(context).size.width;

    if (width >= desktopBreakpoint && desktop != null) {
      return desktop;
    }

    if (width >= mobileBreakpoint && tablet != null) {
      return tablet;
    }

    return mobile;
  }

  /// Get responsive padding based on screen size
  static EdgeInsets getResponsivePadding(BuildContext context) {
    return getResponsiveValue(
      context,
      mobile: const EdgeInsets.all(16),
      tablet: const EdgeInsets.all(24),
      desktop: const EdgeInsets.all(32),
    );
  }

  /// Get responsive horizontal padding based on screen size
  static EdgeInsets getResponsiveHorizontalPadding(BuildContext context) {
    return getResponsiveValue(
      context,
      mobile: const EdgeInsets.symmetric(horizontal: 16),
      tablet: const EdgeInsets.symmetric(horizontal: 48),
      desktop: const EdgeInsets.symmetric(horizontal: 64),
    );
  }

  /// Get responsive font size based on screen size
  static double getResponsiveFontSize(
    BuildContext context, {
    required double baseFontSize,
    double? tabletFontSizeFactor,
    double? desktopFontSizeFactor,
  }) {
    tabletFontSizeFactor ??= 1.1;
    desktopFontSizeFactor ??= 1.2;

    return getResponsiveValue(
      context,
      mobile: baseFontSize,
      tablet: baseFontSize * tabletFontSizeFactor,
      desktop: baseFontSize * desktopFontSizeFactor,
    );
  }

  /// Get responsive width based on screen size percentage
  static double getResponsiveWidth(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.width * percentage;
  }

  /// Get responsive height based on screen size percentage
  static double getResponsiveHeight(BuildContext context, double percentage) {
    return MediaQuery.of(context).size.height * percentage;
  }
}
