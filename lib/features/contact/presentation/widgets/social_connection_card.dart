import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared/widgets/glassmorphic_card.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/contact_model.dart';

/// Social connection card with platform info and stats
class SocialConnectionCard extends StatelessWidget {
  final SocialConnection connection;

  const SocialConnectionCard({
    super.key,
    required this.connection,
  });

  Future<void> _launchUrl() async {
    final uri = Uri.parse(connection.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      enableHover: true,
      onTap: _launchUrl,
      padding: const EdgeInsets.all(AppConstants.spacing20),
      child: Row(
        children: [
          // Icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            ),
            child: Icon(
              connection.icon,
              color: AppColors.textPrimary,
              size: 24,
            ),
          ),

          const SizedBox(width: AppConstants.spacing16),

          // Platform info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  connection.platform,
                  style: AppTypography.h4.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: AppConstants.spacing4),
                Text(
                  connection.stats,
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Arrow icon
          Icon(
            Icons.arrow_forward,
            color: AppColors.textSecondary,
            size: 20,
          ),
        ],
      ),
    );
  }
}
