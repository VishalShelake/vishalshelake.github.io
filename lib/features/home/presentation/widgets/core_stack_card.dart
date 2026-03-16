import 'package:flutter/material.dart';
// Using built-in Flutter icons
import 'package:portfolio_vishal/shared/widgets/glassmorphic_card.dart';
import 'package:portfolio_vishal/shared/widgets/tech_icon.dart';
import 'package:portfolio_vishal/core/theme/app_colors.dart';
import 'package:portfolio_vishal/core/theme/app_typography.dart';
import 'package:portfolio_vishal/core/constants/app_constants.dart';

/// Core tech stack display card
class CoreStackCard extends StatelessWidget {
  const CoreStackCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with icon
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.secondaryBackground,
                  borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                ),
                child: const Center(
                  child: Icon(
                    Icons.code,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(width: AppConstants.spacing12),
              Text(
                'CORE STACK',
                style: AppTypography.label,
              ),
            ],
          ),

          const SizedBox(height: AppConstants.spacing32),

          // Tech stack grid
          Wrap(
            spacing: AppConstants.spacing24,
            runSpacing: AppConstants.spacing24,
            alignment: WrapAlignment.spaceAround,
            children: const [
              TechIcon(
                icon: Icons.flutter_dash,
                label: 'Flutter',
                iconColor: Color(0xFF54C5F8),
              ),
              TechIcon(
                icon: Icons.phone_iphone,
                label: 'Swift / iOS',
                iconColor: AppColors.accentOrange,
              ),
              TechIcon(
                icon: Icons.cloud_done,
                label: 'CI/CD',
                iconColor: AppColors.accentCyan,
              ),
              TechIcon(
                icon: Icons.local_fire_department,
                label: 'Firebase',
                iconColor: Color(0xFFFFCA28),
              ),
              TechIcon(
                icon: Icons.graphic_eq,
                label: 'GraphQL',
                iconColor: Color(0xFFE535AB),
              ),
              TechIcon(
                icon: Icons.android,
                label: 'Android',
                iconColor: Color(0xFF3DDC84),
              ),
              TechIcon(
                icon: Icons.hub,
                label: 'REST APIs',
                iconColor: AppColors.primaryBlue,
              ),
              TechIcon(
                icon: Icons.auto_awesome,
                label: 'AI / LLMs',
                iconColor: Color(0xFF8B5CF6),
              ),
              TechIcon(
                icon: Icons.merge_type,
                label: 'Git',
                iconColor: Color(0xFFF05032),
              ),
              TechIcon(
                icon: Icons.analytics,
                label: 'Analytics',
                iconColor: Color(0xFFF29C1F),
              ),
              TechIcon(
                icon: Icons.dashboard_customize,
                label: 'CMS',
                iconColor: Color(0xFF16A085),
              ),
              TechIcon(
                icon: Icons.storefront,
                label: 'CRM',
                iconColor: Color(0xFFE91E63),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

