import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../shared/widgets/nav_bar.dart';
import '../../../shared/widgets/grid_background.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/services/analytics_mixin.dart';
import '../../../core/navigation/app_navigation.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import 'widgets/hero_section.dart';
import 'widgets/profile_card.dart';
import 'widgets/core_stack_card.dart';
import 'widgets/contact_card.dart';
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

  Future<void> _launchResume() async {
    trackInteraction('Download Resume');
    final url = Uri.parse(AppConstants.resumeUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  void _navigateToTimeline() {
    trackNavigation('Timeline');
    AppNavigation.navigateTo(
      context,
      1, // Timeline index
      currentIndex: _currentNavIndex,
    );
  }

  void _navigateToAboutMe() {
    trackNavigation('About Me');
    AppNavigation.navigateTo(
      context,
      3, // About Me index
      currentIndex: _currentNavIndex,
    );
  }

  void _navigateToContact() {
    trackNavigation('Contact');
    AppNavigation.navigateTo(
      context,
      4, // Contact index
      currentIndex: _currentNavIndex,
    );
  }

  Future<void> _launchArticle() async {
    trackInteraction('Read Article');
    final url = Uri.parse('https://medium.com/@vishal-shelake');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

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
          child: HeroSection(
            onDownloadResume: _launchResume,
            onViewTimeline: _navigateToTimeline,
          ),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 100),
          child: ProfileCard(
            onMoreAboutMe: _navigateToAboutMe,
          ),
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
          child: ContactCard(
            onGetInTouch: _navigateToContact,
          ),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 500),
          child: InsightCard(
            onReadArticle: _launchArticle,
          ),
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
                child: HeroSection(
                  onDownloadResume: _launchResume,
                  onViewTimeline: _navigateToTimeline,
                ),
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
                    child: ProfileCard(
                      onMoreAboutMe: _navigateToAboutMe,
                    ),
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
                child: const CoreStackCard(),
              ),
            ),
            const SizedBox(width: AppConstants.spacing24),
            Expanded(
              child: FadeInRight(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 400),
                child: ContactCard(
                  onGetInTouch: _navigateToContact,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 500),
          child: InsightCard(
            onReadArticle: _launchArticle,
          ),
        ),
      ],
    );
  }

  // Desktop: 3-column masonry layout matching design reference
  Widget _buildDesktopLayout() {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Left column
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FadeInLeft(
                  duration: const Duration(milliseconds: 600),
                  child: HeroSection(
                    onDownloadResume: _launchResume,
                    onViewTimeline: _navigateToTimeline,
                  ),
                ),
                const SizedBox(height: AppConstants.spacing24),
                Expanded(
                  child: FadeInLeft(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 300),
                    child: const SizedBox(
                      width: double.infinity,
                      child: CoreStackCard(),
                    ),
                  ),
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
                  child: _buildViewProjectsCard(),
                ),
                const SizedBox(height: AppConstants.spacing24),
                FadeInUp(
                  duration: const Duration(milliseconds: 600),
                  delay: const Duration(milliseconds: 200),
                  child: ProfileCard(
                    onMoreAboutMe: _navigateToAboutMe,
                  ),
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
                  child: ContactCard(
                    onGetInTouch: _navigateToContact,
                  ),
                ),
                const SizedBox(height: AppConstants.spacing24),
                FadeInRight(
                  duration: const Duration(milliseconds: 600),
                  delay: const Duration(milliseconds: 400),
                  child: InsightCard(
                    onReadArticle: _launchArticle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewProjectsCard() {
    return GestureDetector(
      onTap: () {
        trackNavigation('Projects');
        AppNavigation.navigateTo(
          context,
          2, // Projects tab index
          currentIndex: _currentNavIndex,
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppConstants.spacing24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryBlue.withOpacity(0.15),
              AppColors.primaryBlue.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(AppConstants.radiusXLarge),
          border: Border.all(
            color: AppColors.primaryBlue.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                  ),
                  child: const Icon(
                    Icons.folder_special_rounded,
                    size: 16,
                    color: AppColors.primaryBlue,
                  ),
                ),
                const SizedBox(width: AppConstants.spacing12),
                Text(
                  'SELECTED WORK',
                  style: AppTypography.label.copyWith(
                    color: AppColors.primaryBlue,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppConstants.spacing16),
            Text(
              '25+',
              style: AppTypography.h1.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Apps Shipped',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppConstants.spacing24),
            Row(
              children: [
                Text(
                  'View All Projects',
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.primaryBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: AppConstants.spacing8),
                const Icon(
                  Icons.arrow_forward_rounded,
                  size: 16,
                  color: AppColors.primaryBlue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
