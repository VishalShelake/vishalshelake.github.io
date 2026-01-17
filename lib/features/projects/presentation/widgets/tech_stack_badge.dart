import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';

/// Small pill-shaped badge for displaying technology tags
class TechStackBadge extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isSmall;

  const TechStackBadge({
    super.key,
    required this.label,
    this.backgroundColor,
    this.textColor,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? AppConstants.spacing8 : AppConstants.spacing12,
        vertical: isSmall ? 4 : AppConstants.spacing6,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.cardBackground.withOpacity(0.5),
        border: Border.all(
          color: _getBorderColor(),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
      ),
      child: Text(
        label,
        style:
            (isSmall ? AppTypography.label : AppTypography.bodySmall).copyWith(
          color: textColor ?? _getTextColor(),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Color _getBorderColor() {
    // Return border color based on technology
    if (label.toLowerCase().contains('flutter')) {
      return const Color(0xFF02569B);
    } else if (label.toLowerCase().contains('swift') ||
        label.toLowerCase().contains('ios')) {
      return const Color(0xFFFA7343);
    } else if (label.toLowerCase().contains('firebase')) {
      return const Color(0xFFFFCA28);
    } else if (label.toLowerCase().contains('python')) {
      return const Color(0xFF3776AB);
    } else if (label.toLowerCase().contains('ai') ||
        label.toLowerCase().contains('openai')) {
      return const Color(0xFF10A37F);
    } else if (label.toLowerCase().contains('react')) {
      return const Color(0xFF61DAFB);
    } else if (label.toLowerCase().contains('web3') ||
        label.toLowerCase().contains('blockchain')) {
      return const Color(0xFF8247E5);
    }
    return AppColors.primaryBlue.withOpacity(0.5);
  }

  Color _getTextColor() {
    // Return text color based on technology
    if (label.toLowerCase().contains('flutter')) {
      return const Color(0xFF02569B);
    } else if (label.toLowerCase().contains('swift') ||
        label.toLowerCase().contains('ios')) {
      return const Color(0xFFFA7343);
    } else if (label.toLowerCase().contains('firebase')) {
      return const Color(0xFFFFCA28);
    } else if (label.toLowerCase().contains('python')) {
      return const Color(0xFF3776AB);
    } else if (label.toLowerCase().contains('ai') ||
        label.toLowerCase().contains('openai')) {
      return const Color(0xFF10A37F);
    } else if (label.toLowerCase().contains('react')) {
      return const Color(0xFF61DAFB);
    } else if (label.toLowerCase().contains('web3') ||
        label.toLowerCase().contains('blockchain')) {
      return const Color(0xFF8247E5);
    }
    return AppColors.primaryBlue;
  }
}
