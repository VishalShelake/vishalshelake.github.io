import 'package:flutter/material.dart';
import 'package:portfolio_vishal/core/theme/app_colors.dart';
import 'package:portfolio_vishal/core/theme/app_typography.dart';
import 'package:portfolio_vishal/core/constants/app_constants.dart';
import 'package:portfolio_vishal/shared/widgets/glassmorphic_card.dart';
import 'package:portfolio_vishal/shared/widgets/custom_button.dart' as custom;

/// Contact/CTA card with "Let's Build Together"
class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      backgroundColor: AppColors.primaryBlue,
      enableHover: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email icon
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            ),
            child: const Center(
              child: Icon(
                Icons.email,
                size: 28,
                color: AppColors.textPrimary,
              ),
            ),
          ),

          const SizedBox(height: AppConstants.spacing32),

          // Title
          Text(
            "Let's Build\nTogether",
            style: AppTypography.h2.copyWith(fontSize: 36),
          ),

          const SizedBox(height: AppConstants.spacing48),

          // CTA button
          custom.CustomButton(
            text: 'Get in Touch',
            icon: Icons.arrow_forward,
            iconRight: true,
            buttonStyle: custom.ButtonStyle.secondary,
            width: double.infinity,
            onPressed: () {
              // TODO: Open contact form or email
            },
          ),
        ],
      ),
    );
  }
}
