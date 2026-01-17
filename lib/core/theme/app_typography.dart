import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Typography system for the portfolio
class AppTypography {
  // Display styles (for large numbers like "8+")
  static TextStyle display = GoogleFonts.outfit(
    fontSize: 96,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.0,
  );

  // Headings
  static TextStyle h1 = GoogleFonts.outfit(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle h2 = GoogleFonts.outfit(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle h3 = GoogleFonts.outfit(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle h4 = GoogleFonts.outfit(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // Body text
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.6,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.6,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Special text
  static TextStyle caption = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textTertiary,
    height: 1.4,
  );

  static TextStyle label = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    height: 1.2,
    letterSpacing: 0.5,
  );

  // Button text
  static TextStyle button = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle buttonSmall = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  // Badge text
  static TextStyle badge = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.0,
    letterSpacing: 0.8,
  );
}
