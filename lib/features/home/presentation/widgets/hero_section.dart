import 'package:flutter/material.dart';
// Using built-in Flutter icons
import 'package:portfolio_vishal/shared/widgets/glassmorphic_card.dart';
import 'package:portfolio_vishal/shared/widgets/custom_button.dart' as custom;
import 'package:portfolio_vishal/shared/widgets/section_badge.dart';
import 'package:portfolio_vishal/core/theme/app_colors.dart';
import 'package:portfolio_vishal/core/theme/app_typography.dart';
import 'package:portfolio_vishal/core/constants/app_constants.dart';

/// Hero section with years of experience
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      enableHover: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "Since 2016" badge
          const SectionBadge(
            text: 'Since ${AppConstants.experienceStartYear}',
          ),

          const SizedBox(height: AppConstants.spacing24),

          // Large "8+" display
          Text(
            '${AppConstants.yearsOfExperience}+',
            style: AppTypography.display,
          ),

          const SizedBox(height: AppConstants.spacing16),

          // Title
          Text(
            'Years of Excellence',
            style: AppTypography.h2,
          ),

          const SizedBox(height: AppConstants.spacing16),

          // Description
          Text(
            'Architecting scalable mobile solutions. Specialized in transitioning legacy iOS codebases to modern Flutter ecosystems.',
            style: AppTypography.bodyMedium,
          ),

          const SizedBox(height: AppConstants.spacing32),

          // Buttons
          Wrap(
            spacing: AppConstants.spacing16,
            runSpacing: AppConstants.spacing16,
            children: [
              custom.CustomButton(
                text: 'Download Resume',
                icon: Icons.download,
                buttonStyle: custom.ButtonStyle.primary,
                onPressed: () {
                  // TODO: Implement resume download
                },
              ),
              custom.CustomButton(
                text: 'View Timeline',
                buttonStyle: custom.ButtonStyle.secondary,
                onPressed: () {
                  // TODO: Implement timeline view
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
