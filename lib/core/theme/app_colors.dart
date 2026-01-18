import 'package:flutter/material.dart';

/// Color palette for the portfolio website
class AppColors {
  // Background colors
  static const Color primaryBackground = Color(0xFF0A0E1A);
  static const Color secondaryBackground = Color(0xFF141824);
  static const Color cardBackground = Color(0xFF1A1F2E);
  static const Color cardBackgroundHover = Color(0xFF1F2533);

  // Accent colors
  static const Color primaryBlue = Color(0xFF4A7EFF);
  static const Color primaryBlueDark = Color(0xFF3D6AE6);
  static const Color accentCyan = Color(0xFF00D4FF);
  static const Color accentOrange = Color(0xFFFF6B35);
  static const Color accentGreen = Color(0xFF4AFF88);

  // Surface and border colors
  static const Color surfaceLight = Color(0xFF252A3A);
  static const Color borderColor = Color(0xFF2A3042);

  // Text colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B8D4);
  static const Color textTertiary = Color(0xFF6B7894);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF4A7EFF), Color(0xFF3D6AE6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient contactCardGradient = LinearGradient(
    colors: [Color(0xFF4A7EFF), Color(0xFF5B8DFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glassmorphicBorder = LinearGradient(
    colors: [
      Color(0x40FFFFFF),
      Color(0x10FFFFFF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shadow colors
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowDark = Color(0x40000000);

  // Overlay colors
  static const Color overlayDark = Color(0x80000000);
  static const Color overlayGradient = Color(0xCC0A0E1A);

  // Liquid Glass Spotlight Effect
  static const Color spotlightColor = Color(0x404A7EFF);
  static const Color spotlightEdge = Color(0x20FFFFFF);
  static const Color liquidGlassHighlight = Color(0x15FFFFFF);
}
