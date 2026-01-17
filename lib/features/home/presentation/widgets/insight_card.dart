import 'package:flutter/material.dart';
// Using built-in Flutter icons
import 'package:portfolio_vishal/shared/widgets/glassmorphic_card.dart';
import 'package:portfolio_vishal/shared/widgets/section_badge.dart';
import 'package:portfolio_vishal/shared/widgets/custom_button.dart' as custom;
import 'package:portfolio_vishal/core/theme/app_colors.dart';
import 'package:portfolio_vishal/core/theme/app_typography.dart';
import 'package:portfolio_vishal/core/constants/app_constants.dart';

/// Latest insight/article card
class InsightCard extends StatelessWidget {
  const InsightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      enableHover: true,
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          // Background image with overlay
          Container(
            height: 400,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF0A1929),
                  const Color(0xFF132F4C),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppConstants.radiusXLarge),
            ),
            child: Stack(
              children: [
                // Pattern overlay
                Opacity(
                  opacity: 0.3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppConstants.radiusXLarge),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1639762681485-074b7f938ba0?w=800',
                        ),
                        fit: BoxFit.cover,
                        opacity: 0.2,
                      ),
                    ),
                  ),
                ),

                // Gradient overlay for text readability
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppConstants.radiusXLarge),
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppColors.overlayGradient,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.spacing24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge
                  const SectionBadge(
                    text: 'Latest Insight',
                    icon: Icons.lightbulb,
                  ),

                  const Spacer(),

                  // Article title
                  Text(
                    'AI-Driven Mobile Dev',
                    style: AppTypography.h2,
                  ),

                  const SizedBox(height: AppConstants.spacing16),

                  // Article excerpt
                  Text(
                    'How I\'m integrating LLMs into the CI/CD pipeline to automate code reviews and generate unit tests for Flutter widgets.',
                    style: AppTypography.bodyMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: AppConstants.spacing24),

                  // Read button
                  custom.CustomButton(
                    text: 'Read Article',
                    buttonStyle: custom.ButtonStyle.text,
                    onPressed: () {
                      // TODO: Open article
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
