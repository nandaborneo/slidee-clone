import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';

/// Button types available in the app
enum AppButtonType { primary, secondary, tertiary }

/// Button sizes available in the app
enum AppButtonSize { small, medium, large }

/// Reusable button component for Slidee App
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final AppButtonType type;
  final AppButtonSize size;
  final bool isFullWidth;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;

  const AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.type = AppButtonType.primary,
    this.size = AppButtonSize.medium,
    this.isFullWidth = false,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine button style based on type
    Widget button;
    switch (type) {
      case AppButtonType.primary:
        button = _buildElevatedButton(context);
        break;
      case AppButtonType.secondary:
        button = _buildOutlinedButton(context);
        break;
      case AppButtonType.tertiary:
        button = _buildTextButton(context);
        break;
    }

    // Apply full width if needed
    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }

  // Get padding based on button size
  EdgeInsets _getPadding() {
    switch (size) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 32, vertical: 16);
    }
  }

  // Get text style based on button size
  TextStyle _getTextStyle(BuildContext context) {
    switch (size) {
      case AppButtonSize.small:
        return AppTextStyles.buttonSmall(context);
      case AppButtonSize.medium:
        return AppTextStyles.buttonMedium(context);
      case AppButtonSize.large:
        return AppTextStyles.buttonLarge(context);
    }
  }

  // Build primary button (elevated)
  Widget _buildElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisabled || isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: _getPadding(),
        textStyle: _getTextStyle(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      child: _buildButtonContent(context),
    );
  }

  // Build secondary button (outlined)
  Widget _buildOutlinedButton(BuildContext context) {
    return OutlinedButton(
      onPressed: isDisabled || isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        padding: _getPadding(),
        textStyle: _getTextStyle(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      child: _buildButtonContent(context),
    );
  }

  // Build tertiary button (text)
  Widget _buildTextButton(BuildContext context) {
    return TextButton(
      onPressed: isDisabled || isLoading ? null : onPressed,
      style: TextButton.styleFrom(
        padding: _getPadding(),
        textStyle: _getTextStyle(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      child: _buildButtonContent(context),
    );
  }

  // Build button content (text, icon, loading indicator)
  Widget _buildButtonContent(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color:
              type == AppButtonType.primary
                  ? Colors.white
                  : Theme.of(context).primaryColor,
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(icon, size: 18), const SizedBox(width: 8), Text(text)],
      );
    }

    return Text(text);
  }
}
