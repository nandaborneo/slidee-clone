import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Text styles for Slidee App
class AppTextStyles {
  // Headings
  static TextStyle heading1(BuildContext context) => TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color:
        Theme.of(context).brightness == Brightness.light
            ? AppColors.textPrimaryLight
            : AppColors.textPrimaryDark,
    height: 1.2,
  );

  static TextStyle heading2(BuildContext context) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color:
        Theme.of(context).brightness == Brightness.light
            ? AppColors.textPrimaryLight
            : AppColors.textPrimaryDark,
    height: 1.3,
  );

  static TextStyle heading3(BuildContext context) => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color:
        Theme.of(context).brightness == Brightness.light
            ? AppColors.textPrimaryLight
            : AppColors.textPrimaryDark,
    height: 1.4,
  );

  // Body text
  static TextStyle bodyLarge(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color:
        Theme.of(context).brightness == Brightness.light
            ? AppColors.textPrimaryLight
            : AppColors.textPrimaryDark,
    height: 1.5,
  );

  static TextStyle bodyMedium(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color:
        Theme.of(context).brightness == Brightness.light
            ? AppColors.textPrimaryLight
            : AppColors.textPrimaryDark,
    height: 1.5,
  );

  static TextStyle bodySmall(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color:
        Theme.of(context).brightness == Brightness.light
            ? AppColors.textSecondaryLight
            : AppColors.textSecondaryDark,
    height: 1.5,
  );

  // Button text
  static TextStyle buttonLarge(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color:
        Theme.of(context).brightness == Brightness.light
            ? AppColors.buttonTertiaryLight
            : AppColors.buttonTertiaryDark,
    letterSpacing: 0.5,
  );

  static TextStyle buttonMedium(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color:
        Theme.of(context).brightness == Brightness.light
            ? AppColors.buttonTertiaryLight
            : AppColors.buttonTertiaryDark,
    letterSpacing: 0.5,
  );

  static TextStyle buttonSmall(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color:
        Theme.of(context).brightness == Brightness.light
            ? AppColors.buttonTertiaryLight
            : AppColors.buttonTertiaryDark,
    letterSpacing: 0.5,
  );

  // Caption and overline
  static TextStyle caption(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color:
        Theme.of(context).brightness == Brightness.light
            ? AppColors.textSecondaryLight
            : AppColors.textSecondaryDark,
    letterSpacing: 0.4,
  );

  static TextStyle overline(BuildContext context) => TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color:
        Theme.of(context).brightness == Brightness.light
            ? AppColors.textSecondaryLight
            : AppColors.textSecondaryDark,
    letterSpacing: 1.5,
    textBaseline: TextBaseline.alphabetic,
  );

  // Username and handle styles for posts
  static TextStyle username(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color:
        Theme.of(context).brightness == Brightness.light
            ? AppColors.textPrimaryLight
            : AppColors.textPrimaryDark,
  );

  static TextStyle handle(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color:
        Theme.of(context).brightness == Brightness.light
            ? AppColors.textSecondaryLight
            : AppColors.textSecondaryDark,
  );

  // Timestamp style for posts
  static TextStyle timestamp(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color:
        Theme.of(context).brightness == Brightness.light
            ? AppColors.textSecondaryLight
            : AppColors.textSecondaryDark,
  );
}
