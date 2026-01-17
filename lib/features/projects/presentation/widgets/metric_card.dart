import 'package:flutter/material.dart';
import '../../data/models/project_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';

/// Metric card for displaying key results/statistics
class MetricCard extends StatelessWidget {
  final ProjectMetric metric;
  final int index;

  const MetricCard({
    super.key,
    required this.metric,
    this.index = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing20),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(
          color: _getBorderColor(),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Value
          Text(
            metric.value,
            style: AppTypography.h2.copyWith(
              fontSize: 36,
              color: _getValueColor(),
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: AppConstants.spacing8),

          // Label
          Text(
            metric.label,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),

          if (metric.description != null) ...[
            const SizedBox(height: AppConstants.spacing4),
            Text(
              metric.description!,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getBackgroundColor() {
    final colors = [
      const Color(0xFF1E3A8A).withOpacity(0.2),
      const Color(0xFF7C3AED).withOpacity(0.2),
      const Color(0xFF0891B2).withOpacity(0.2),
    ];
    return colors[index % colors.length];
  }

  Color _getBorderColor() {
    final colors = [
      const Color(0xFF3B82F6),
      const Color(0xFF8B5CF6),
      const Color(0xFF06B6D4),
    ];
    return colors[index % colors.length];
  }

  Color _getValueColor() {
    final colors = [
      const Color(0xFF60A5FA),
      const Color(0xFFA78BFA),
      const Color(0xFF22D3EE),
    ];
    return colors[index % colors.length];
  }
}
