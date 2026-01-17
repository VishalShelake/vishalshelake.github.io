import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../shared/widgets/nav_bar.dart';
import '../../../shared/widgets/grid_background.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/services/analytics_mixin.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/navigation/app_navigation.dart';
import '../data/models/experience_model.dart';
import 'widgets/timeline_item_card.dart';
import 'widgets/timeline_connector.dart';

/// Timeline/Experience screen showcasing professional journey
class TimelineScreen extends StatefulWidget {
  const TimelineScreen({super.key});

  @override
  State<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends State<TimelineScreen>
    with AnalyticsScreenMixin {
  @override
  String get screenName => 'Timeline';

  int _currentNavIndex = 1; // Experience tab

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Scaffold(
      body: buildScrollableBody(
        child: Stack(
          children: [
            // Decorative grid background
            const GridBackground(),

            // Scrollable content (behind the NavBar)
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 88),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: isMobile
                        ? ResponsiveUtils.getMaxContentWidth(context)
                        : 900,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveUtils.getResponsivePadding(context),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: AppConstants.spacing48),

                      // Header section
                      FadeInDown(
                        duration: const Duration(milliseconds: 600),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppConstants.spacing16,
                                vertical: AppConstants.spacing8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryBlue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(
                                  AppConstants.radiusLarge,
                                ),
                                border: Border.all(
                                  color: AppColors.primaryBlue.withOpacity(0.3),
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primaryBlue,
                                    ),
                                  ),
                                  const SizedBox(width: AppConstants.spacing8),
                                  Text(
                                    'Present',
                                    style: AppTypography.label.copyWith(
                                      color: AppColors.primaryBlue,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: AppConstants.spacing24),
                            Text(
                              'Professional Journey',
                              style: AppTypography.h1,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppConstants.spacing16),
                            Text(
                              'A timeline of solving complex engineering challenges, from scaling startups to architecting enterprise Flutter solutions.',
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppConstants.spacing64),

                      // Timeline items
                      ...List.generate(
                        ExperienceModel.sampleExperiences.length,
                        (index) {
                          final experience =
                              ExperienceModel.sampleExperiences[index];
                          final isFirst = index == 0;
                          final isLast = index ==
                              ExperienceModel.sampleExperiences.length - 1;

                          return FadeInUp(
                            duration: const Duration(milliseconds: 600),
                            delay: Duration(milliseconds: 100 * index),
                            child: isMobile
                                ? _buildMobileTimelineItem(
                                    experience,
                                    isFirst,
                                    isLast,
                                  )
                                : _buildDesktopTimelineItem(
                                    experience,
                                    isFirst,
                                    isLast,
                                  ),
                          );
                        },
                      ),

                      const SizedBox(height: AppConstants.spacing96),
                    ],
                  ),
                ),
              ),
            ),

            // Glass NavBar on top
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: NavBar(
                currentIndex: _currentNavIndex,
                onItemTap: (index) {
                  AppNavigation.navigateTo(
                    context,
                    index,
                    currentIndex: _currentNavIndex,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopTimelineItem(
    ExperienceModel experience,
    bool isFirst,
    bool isLast,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline connector
        TimelineConnector(
          year: experience.period,
          isFirst: isFirst,
          isLast: isLast,
          isCurrent: experience.isCurrent,
        ),
        const SizedBox(width: AppConstants.spacing32),

        // Experience card
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppConstants.spacing32),
            child: TimelineItemCard(experience: experience),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileTimelineItem(
    ExperienceModel experience,
    bool isFirst,
    bool isLast,
  ) {
    return Column(
      children: [
        // Year badge for mobile
        if (!isFirst) const SizedBox(height: AppConstants.spacing24),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacing16,
            vertical: AppConstants.spacing8,
          ),
          decoration: BoxDecoration(
            color: experience.isCurrent
                ? AppColors.primaryBlue.withOpacity(0.2)
                : AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
            border: Border.all(
              color: experience.isCurrent
                  ? AppColors.primaryBlue
                  : AppColors.textTertiary.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Text(
            experience.duration,
            style: AppTypography.label.copyWith(
              color: experience.isCurrent
                  ? AppColors.primaryBlue
                  : AppColors.textSecondary,
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(height: AppConstants.spacing16),

        // Experience card
        TimelineItemCard(experience: experience),
      ],
    );
  }
}
