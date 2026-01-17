import 'package:flutter/material.dart';
import '../../../../shared/widgets/glassmorphic_card.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/experience_model.dart';
import 'tech_badge.dart';

/// Individual timeline item card displaying experience details
class TimelineItemCard extends StatelessWidget {
  final ExperienceModel experience;

  const TimelineItemCard({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      enableHover: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with company and duration
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company icon placeholder
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                ),
                child: const Icon(
                  Icons.business,
                  color: AppColors.textPrimary,
                  size: 24,
                ),
              ),
              const SizedBox(width: AppConstants.spacing16),
              // Company and role
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      experience.company,
                      style: AppTypography.h4,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      experience.role,
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.primaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
              // Duration badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.spacing12,
                  vertical: AppConstants.spacing4,
                ),
                decoration: BoxDecoration(
                  color: experience.isCurrent
                      ? AppColors.primaryBlue.withOpacity(0.2)
                      : AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                  border: Border.all(
                    color: experience.isCurrent
                        ? AppColors.primaryBlue
                        : AppColors.textTertiary.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Text(
                  experience.isCurrent ? 'Full-time' : 'Contract',
                  style: AppTypography.label.copyWith(
                    color: experience.isCurrent
                        ? AppColors.primaryBlue
                        : AppColors.textSecondary,
                    fontSize: 11,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppConstants.spacing16),

          // Description
          Text(
            experience.description,
            style: AppTypography.bodySmall,
          ),

          // Achievements
          if (experience.achievements.isNotEmpty) ...[
            const SizedBox(height: AppConstants.spacing16),
            ...experience.achievements.map((achievement) => Padding(
                  padding: const EdgeInsets.only(bottom: AppConstants.spacing8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 6,
                          right: AppConstants.spacing8,
                        ),
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          achievement,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],

          // Tech stack
          if (experience.techStack.isNotEmpty) ...[
            const SizedBox(height: AppConstants.spacing16),
            Wrap(
              spacing: AppConstants.spacing8,
              runSpacing: AppConstants.spacing8,
              children: experience.techStack
                  .map((tech) => TechBadge(label: tech))
                  .toList(),
            ),
          ],
        ],
      ),
    );
  }
}
