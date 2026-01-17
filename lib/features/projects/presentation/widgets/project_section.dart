import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';

/// Reusable section container for project detail screen
class ProjectSection extends StatelessWidget {
  final String title;
  final IconData? icon;
  final String? emoji;
  final Widget child;
  final EdgeInsets? padding;

  const ProjectSection({
    super.key,
    required this.title,
    this.icon,
    this.emoji,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(AppConstants.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Row(
            children: [
              if (emoji != null) ...[
                Text(
                  emoji!,
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(width: AppConstants.spacing12),
              ],
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 24,
                  color: AppColors.primaryBlue,
                ),
                const SizedBox(width: AppConstants.spacing12),
              ],
              Expanded(
                child: Text(
                  title,
                  style: AppTypography.h3.copyWith(fontSize: 24),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppConstants.spacing24),

          // Section content
          child,
        ],
      ),
    );
  }
}
