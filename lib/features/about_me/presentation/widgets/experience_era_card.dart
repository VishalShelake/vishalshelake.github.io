import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/widgets/glassmorphic_card.dart';

/// Card component for showcasing different experience eras
/// with iOS 26 liquid glass effect
class ExperienceEraCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ExperienceEraCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      enableHover: true,
      enableSpotlight: true,
      padding: const EdgeInsets.all(AppConstants.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(AppConstants.spacing12),
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            ),
            child: Icon(
              icon,
              color: AppColors.textPrimary,
              size: 24,
            ),
          ),
          const SizedBox(height: AppConstants.spacing16),

          // Title
          Text(
            title,
            style: AppTypography.h4.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppConstants.spacing12),

          // Description
          Text(
            description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
