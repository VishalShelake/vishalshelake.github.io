import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// Utility class for responsive design helpers
class ResponsiveUtils {
  /// Check if screen is mobile size
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < AppConstants.mobileBreakpoint;
  }

  /// Check if screen is tablet size
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppConstants.mobileBreakpoint &&
        width < AppConstants.desktopBreakpoint;
  }

  /// Check if screen is desktop size
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppConstants.desktopBreakpoint;
  }

  /// Check if screen is wide desktop
  static bool isWideDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppConstants.wideBreakpoint;
  }

  /// Get responsive padding based on screen size
  static double getResponsivePadding(BuildContext context) {
    if (isMobile(context)) {
      return AppConstants.spacing16;
    } else if (isTablet(context)) {
      return AppConstants.spacing32;
    } else {
      return AppConstants.spacing48;
    }
  }

  /// Get responsive horizontal padding
  static EdgeInsets getResponsiveHorizontalPadding(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: getResponsivePadding(context));
  }

  /// Get responsive content max width
  static double getMaxContentWidth(BuildContext context) {
    if (isWideDesktop(context)) {
      return 1400;
    } else if (isDesktop(context)) {
      return 1200;
    } else {
      return double.infinity;
    }
  }

  /// Get responsive grid columns
  static int getGridColumns(BuildContext context) {
    if (isMobile(context)) {
      return 1;
    } else if (isTablet(context)) {
      return 2;
    } else {
      return 3;
    }
  }

  /// Get responsive value based on screen size
  static T getResponsiveValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context) && desktop != null) {
      return desktop;
    } else if (isTablet(context) && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
