import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../shared/widgets/nav_bar.dart';
import '../../../shared/widgets/grid_background.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/services/analytics_mixin.dart';
import '../../../core/navigation/app_navigation.dart';
import 'widgets/hero_section.dart';
import 'widgets/profile_card.dart';
import 'widgets/core_stack_card.dart';
import 'widgets/contact_card.dart';
import 'widgets/featured_project_card.dart';
import 'widgets/insight_card.dart';
import 'widgets/footer.dart';

/// Main home screen that composes all sections
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AnalyticsScreenMixin {
  @override
  String get screenName => 'Home';

  int _currentNavIndex = 0;

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
              // Add top padding to account for NavBar height
              padding: const EdgeInsets.only(top: 88), // NavBar height (~88px)
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

                      // Responsive grid layout based on the design reference
                      if (isMobile) _buildMobileLayout(),
                      if (isTablet) _buildTabletLayout(),
                      if (!isMobile && !isTablet) _buildDesktopLayout(),

                      const SizedBox(height: AppConstants.spacing64),

                      // Footer
                      FadeInUp(
                        duration: const Duration(milliseconds: 600),
                        delay: const Duration(milliseconds: 800),
                        child: const Footer(),
                      ),

                      const SizedBox(height: AppConstants.spacing32),
                    ],
                  ),
                ),
              ),
            ),

            // Glass NavBar on top (overlapping content)
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
          child: const HeroSection(),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 100),
          child: const ProfileCard(),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 200),
          child: const CoreStackCard(),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 300),
          child: const ContactCard(),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 400),
          child: const FeaturedProjectCard(),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 500),
          child: const InsightCard(),
        ),
      ],
    );
  }

  // Tablet: 2-column grid
  Widget _buildTabletLayout() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: FadeInLeft(
                duration: const Duration(milliseconds: 600),
                child: const HeroSection(),
              ),
            ),
            const SizedBox(width: AppConstants.spacing24),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  FadeInRight(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 100),
                    child: const ProfileCard(),
                  ),
                  const SizedBox(height: AppConstants.spacing24),
                  FadeInRight(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 200),
                    child: const CoreStackCard(),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.spacing24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: FadeInLeft(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 300),
                child: const FeaturedProjectCard(),
              ),
            ),
            const SizedBox(width: AppConstants.spacing24),
            Expanded(
              child: FadeInRight(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 400),
                child: const ContactCard(),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 500),
          child: const InsightCard(),
        ),
      ],
    );
  }

  // Desktop: 3-column masonry layout matching design reference
  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left column
        Expanded(
          flex: 2,
          child: Column(
            children: [
              FadeInLeft(
                duration: const Duration(milliseconds: 600),
                child: const HeroSection(),
              ),
              const SizedBox(height: AppConstants.spacing24),
              FadeInLeft(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 300),
                child: const FeaturedProjectCard(),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppConstants.spacing24),

        // Middle column
        Expanded(
          flex: 1,
          child: Column(
            children: [
              FadeInUp(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 100),
                child: const ProfileCard(),
              ),
              const SizedBox(height: AppConstants.spacing24),
              FadeInUp(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 200),
                child: const CoreStackCard(),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppConstants.spacing24),

        // Right column
        Expanded(
          flex: 1,
          child: Column(
            children: [
              FadeInRight(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 250),
                child: const ContactCard(),
              ),
              const SizedBox(height: AppConstants.spacing24),
              FadeInRight(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 400),
                child: const InsightCard(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
