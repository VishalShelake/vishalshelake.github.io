import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/widgets/glassmorphic_card.dart';

/// Reusable statistics card widget with iOS 26 liquid glass effect
class StatsCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const StatsCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      enableHover: true,
      enableSpotlight: true,
      padding: const EdgeInsets.all(AppConstants.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(AppConstants.spacing12),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            ),
            child: Icon(
              icon,
              color: AppColors.primaryBlue,
              size: 24,
            ),
          ),
          const SizedBox(height: AppConstants.spacing16),

          // Label
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: AppConstants.spacing8),

          // Value
          Text(
            value,
            style: AppTypography.h2.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
