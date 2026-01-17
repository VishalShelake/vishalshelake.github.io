import 'package:flutter/material.dart';
// Using built-in Flutter icons
import 'package:portfolio_vishal/shared/widgets/glassmorphic_card.dart';
import 'package:portfolio_vishal/shared/widgets/section_badge.dart';
import 'package:portfolio_vishal/core/theme/app_colors.dart';
import 'package:portfolio_vishal/core/theme/app_typography.dart';
import 'package:portfolio_vishal/core/constants/app_constants.dart';

/// Featured project showcase card
class FeaturedProjectCard extends StatelessWidget {
  const FeaturedProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      enableHover: true,
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project images
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.secondaryBackground,
                  AppColors.cardBackground,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppConstants.radiusXLarge),
                topRight: Radius.circular(AppConstants.radiusXLarge),
              ),
            ),
            child: Stack(
              children: [
                // Placeholder for project images
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                          width: 100,
                          height: 160,
                          decoration: BoxDecoration(
                            color:
                                AppColors.secondaryBackground.withOpacity(0.5),
                            borderRadius:
                                BorderRadius.circular(AppConstants.radiusSmall),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.bar_chart,
                              size: 40,
                              color: AppColors.textTertiary,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                // Featured badge
                const Positioned(
                  top: AppConstants.spacing16,
                  left: AppConstants.spacing16,
                  child: SectionBadge(text: 'Featured'),
                ),

                // External link button
                Positioned(
                  bottom: AppConstants.spacing16,
                  right: AppConstants.spacing16,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.open_in_new,
                        size: 20,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Project details
          Padding(
            padding: const EdgeInsets.all(AppConstants.spacing24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FinTech V2',
                  style: AppTypography.h3,
                ),
                const SizedBox(height: AppConstants.spacing12),
                Text(
                  'A complete rewrite in Flutter achieving 99.9% crash-free rate and 2x performance boost.',
                  style: AppTypography.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
