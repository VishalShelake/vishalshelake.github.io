import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Vertical timeline connector with year marker
class TimelineConnector extends StatelessWidget {
  final String year;
  final bool isFirst;
  final bool isLast;
  final bool isCurrent;

  const TimelineConnector({
    super.key,
    required this.year,
    this.isFirst = false,
    this.isLast = false,
    this.isCurrent = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          // Top line
          if (!isFirst)
            Container(
              width: 2,
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryBlue.withOpacity(0.5),
                    AppColors.primaryBlue,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),

          // Year marker with dot
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Year text
              Text(
                year,
                style: TextStyle(
                  color: isCurrent
                      ? AppColors.primaryBlue
                      : AppColors.textTertiary,
                  fontSize: 14,
                  fontWeight: isCurrent ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
              const SizedBox(width: 16),
              // Dot
              Container(
                width: isCurrent ? 16 : 12,
                height: isCurrent ? 16 : 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCurrent
                      ? AppColors.primaryBlue
                      : AppColors.cardBackground,
                  border: Border.all(
                    color: AppColors.primaryBlue,
                    width: isCurrent ? 3 : 2,
                  ),
                  boxShadow: isCurrent
                      ? [
                          BoxShadow(
                            color: AppColors.primaryBlue.withOpacity(0.5),
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ]
                      : null,
                ),
              ),
            ],
          ),

          // Bottom line
          if (!isLast)
            Container(
              width: 2,
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryBlue,
                    AppColors.primaryBlue.withOpacity(0.5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
