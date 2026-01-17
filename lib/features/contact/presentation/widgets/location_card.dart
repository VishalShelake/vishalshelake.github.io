import 'package:flutter/material.dart';
import '../../../../shared/widgets/glassmorphic_card.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/contact_model.dart';

/// Location card showing current base and timezone
class LocationCard extends StatelessWidget {
  final LocationInfo location;

  const LocationCard({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      padding: const EdgeInsets.all(AppConstants.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BASE label
          Text(
            'BASE',
            style: AppTypography.label.copyWith(
              color: AppColors.textSecondary,
              fontSize: 11,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: AppConstants.spacing16),

          // City with indicator
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: AppConstants.spacing12),
              Expanded(
                child: Text(
                  location.city,
                  style: AppTypography.h2.copyWith(
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppConstants.spacing12),

          // Timezone info
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.accentGreen,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppConstants.spacing8),
                Text(
                  '${location.timezone} • ${location.currentTime}',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
