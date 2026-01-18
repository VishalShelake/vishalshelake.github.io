import 'package:flutter/material.dart';
// Using built-in Flutter icons
import 'package:portfolio_vishal/shared/widgets/glassmorphic_card.dart';
import 'package:portfolio_vishal/shared/widgets/custom_button.dart' as custom;
import 'package:portfolio_vishal/core/theme/app_colors.dart';
import 'package:portfolio_vishal/core/theme/app_typography.dart';
import 'package:portfolio_vishal/core/constants/app_constants.dart';

/// Profile card with image and bio
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      enableHover: true,
      child: Column(
        children: [
          // Profile image
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
              border: Border.all(
                color: AppColors.primaryBlue.withOpacity(0.5),
                width: 3,
              ),
            ),
            child: ClipOval(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.cardBackground,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/developer_profile_photo.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: AppConstants.spacing24),

          // Name
          Text(
            AppConstants.portfolioName,
            style: AppTypography.h3,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: AppConstants.spacing8),

          // Title
          Text(
            AppConstants.portfolioTitle,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.primaryBlue,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: AppConstants.spacing24),

          // Bio
          Text(
            AppConstants.portfolioBio,
            style: AppTypography.bodySmall,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: AppConstants.spacing32),

          // "More about me" button
          custom.CustomButton(
            text: 'More about me',
            icon: Icons.arrow_forward,
            iconRight: true,
            buttonStyle: custom.ButtonStyle.text,
            width: double.infinity,
            onPressed: () {
              // TODO: Navigate to about page
            },
          ),
        ],
      ),
    );
  }
}
