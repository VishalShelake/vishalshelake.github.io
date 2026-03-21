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
import 'widgets/profile_section.dart';
import 'widgets/stats_card.dart';
import 'widgets/experience_era_card.dart';
import 'widgets/learning_section.dart';

/// About Me screen showcasing professional profile and journey
class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({super.key});

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen>
    with AnalyticsScreenMixin {
  @override
  String get screenName => 'About Me';

  int _currentNavIndex = 3; // About Me tab

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);

    return Scaffold(
      body: buildScrollableBody(
        child: Stack(
          children: [
            // Decorative grid background
            GridBackground(),

            // Scrollable content (behind the NavBar)
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 88),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: ResponsiveUtils.getMaxContentWidth(context),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveUtils.getResponsivePadding(context),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: AppConstants.spacing32),

                      // Header section
                      FadeInDown(
                        duration: const Duration(milliseconds: 600),
                        child: Column(
                          children: [
                            Text(
                              'About Me',
                              style: AppTypography.h1,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppConstants.spacing16),
                            Text(
                              'Senior Mobile Engineer — iOS & Flutter. Architecting scalable apps, leading teams, and shipping with AI-powered velocity.',
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppConstants.spacing48),

                      // Responsive layout
                      if (isMobile) _buildMobileLayout(),
                      if (isTablet) _buildTabletLayout(),
                      if (!isMobile && !isTablet) _buildDesktopLayout(),

                      const SizedBox(height: AppConstants.spacing64),
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

  // Mobile: Single column layout
  Widget _buildMobileLayout() {
    return Column(
      children: [
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 100),
          child: const ProfileSection(),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 200),
          child: const StatsCard(
            icon: Icons.access_time,
            label: 'Years Experience',
            value: '8',
          ),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 250),
          child: const StatsCard(
            icon: Icons.rocket_launch,
            label: 'Apps Shipped',
            value: '25+',
          ),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 300),
          child: const ExperienceEraCard(
            icon: Icons.phone_iphone,
            title: 'Native iOS Development',
            description:
                'Extensive experience building native iOS apps with Swift and Objective-C — shipping production features across App Store releases, mastering UIKit, Core Data, and RESTful integrations. I actively maintain a strong foundation in Apple\'s ecosystem, ready to deliver high-quality native experiences.',
          ),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 350),
          child: const ExperienceEraCard(
            icon: Icons.flutter_dash,
            title: 'Flutter & Cross-Platform',
            description:
                'Architecting and delivering scalable cross-platform Flutter applications supporting both iOS and Android. By combining Flutter\'s efficiency with my deep native iOS expertise, I am fully equipped to handle and lead both unified cross-platform solutions as well as dedicated native iOS projects.',
          ),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 400),
          child: const ExperienceEraCard(
            icon: Icons.auto_awesome,
            title: 'Modern AI Workflow',
            description:
                'Leveraging LLMs for code generation, automated testing workflows, and building intelligent agents to speed up delivery.',
          ),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 450),
          child: const LearningSection(),
        ),
      ],
    );
  }

  // Tablet: 2-column grid
  Widget _buildTabletLayout() {
    return Column(
      children: [
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 100),
          child: const ProfileSection(),
        ),
        const SizedBox(height: AppConstants.spacing24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FadeInLeft(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 200),
                child: const StatsCard(
                  icon: Icons.access_time,
                  label: 'Years Experience',
                  value: '8',
                ),
              ),
            ),
            const SizedBox(width: AppConstants.spacing24),
            Expanded(
              child: FadeInRight(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 250),
                child: const StatsCard(
                  icon: Icons.rocket_launch,
                  label: 'Apps Shipped',
                  value: '25+',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 300),
          child: const ExperienceEraCard(
            icon: Icons.phone_iphone,
            title: 'Native iOS Development',
            description:
                'Extensive experience building native iOS apps with Swift and Objective-C — shipping production features across App Store releases, mastering UIKit, Core Data, and RESTful integrations. I actively maintain a strong foundation in Apple\'s ecosystem, ready to deliver high-quality native experiences.',
          ),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 350),
          child: const ExperienceEraCard(
            icon: Icons.flutter_dash,
            title: 'Flutter & Cross-Platform',
            description:
                'Architecting and delivering scalable cross-platform Flutter applications supporting both iOS and Android. By combining Flutter\'s efficiency with my deep native iOS expertise, I am fully equipped to handle and lead both unified cross-platform solutions as well as dedicated native iOS projects.',
          ),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 400),
          child: const ExperienceEraCard(
            icon: Icons.auto_awesome,
            title: 'Modern AI Workflow',
            description:
                'Leveraging LLMs for code generation, automated testing workflows, and building intelligent agents to speed up delivery.',
          ),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 450),
          child: const LearningSection(),
        ),
      ],
    );
  }

  // Desktop: Layout matching design reference
  Widget _buildDesktopLayout() {
    return Column(
      children: [
        // Top row: Profile section (left) and Stats (right)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile section - takes more space
            Expanded(
              flex: 3,
              child: FadeInLeft(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 100),
                child: const ProfileSection(),
              ),
            ),
            const SizedBox(width: AppConstants.spacing24),

            // Stats column - narrower
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInRight(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 200),
                    child: const StatsCard(
                      icon: Icons.access_time,
                      label: 'Years Experience',
                      value: '8',
                    ),
                  ),
                  const SizedBox(height: AppConstants.spacing24),
                  FadeInRight(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 250),
                    child: const StatsCard(
                      icon: Icons.rocket_launch,
                      label: 'Apps Shipped',
                      value: '25+',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.spacing32),

        // Experience era cards in 3-column grid
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FadeInUp(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 300),
                child: const ExperienceEraCard(
                  icon: Icons.phone_iphone,
                  title: 'Native iOS Development',
                  description:
                      'Extensive experience building native iOS apps with Swift and Objective-C — shipping production features across App Store releases, mastering UIKit, Core Data, and RESTful integrations. I actively maintain a strong foundation in Apple\'s ecosystem, ready to deliver high-quality native experiences.',
                ),
              ),
            ),
            const SizedBox(width: AppConstants.spacing24),
            Expanded(
              child: FadeInUp(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 350),
                child: const ExperienceEraCard(
                  icon: Icons.flutter_dash,
                  title: 'Flutter & Cross-Platform',
                  description:
                      'Architecting and delivering scalable cross-platform Flutter applications supporting both iOS and Android. By combining Flutter\'s efficiency with my deep native iOS expertise, I am fully equipped to handle and lead both unified cross-platform solutions as well as dedicated native iOS projects.',
                ),
              ),
            ),
            const SizedBox(width: AppConstants.spacing24),
            Expanded(
              child: FadeInUp(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 400),
                child: const ExperienceEraCard(
                  icon: Icons.auto_awesome,
                  title: 'Modern AI Workflow',
                  description:
                      'Leveraging LLMs for code generation, automated testing workflows, and building intelligent agents to speed up delivery.',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.spacing32),

        // Learning section spanning full width
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 450),
          child: const LearningSection(),
        ),
      ],
    );
  }
}
