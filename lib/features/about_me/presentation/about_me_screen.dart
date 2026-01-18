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
                              '8 Years of crafting scalable mobile experiences. From Objective-C memory management to reactive Flutter architectures.',
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
            value: '8+',
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
            title: 'The iOS Era (2016-2020)',
            description:
                "It all began soon after I realised my interest in computers. Today, I'm interested in iOS development because of the high number of iOS users in large domestic demographic, as well as Apple's customer-friendly attitude. Learning Swift and understanding the inner workings of app development has been a lot of fun for me. It's a fascinating tale. When I was growing up, I was used to using Windows computers and was comfortable with the Windows environment, so seeing someone using the Mac Operating System was unusual. When I was in college, one of my friends brought his MacBook Air, and I had the opportunity to handle it, but to be honest, I had no idea how to use it because everything was disregarded as coming from a Windows environment. This piqued my interest in learning more about the Apple ecosystem, and I fell in love with it, thus my journey began. When it comes to iOS programming, The first few years were quite difficult. I'm not sure where to begin, and I don't have a Mac system to work with. Fortunately, I was able to obtain my own Mac Mini, and things became much easier. As I come from an area where I am aware of the lack of senior resources to assist me, I chose an out of the box track for me with the same effects on any simpler task where I can get stuck, which is very heartbreaking for a fresher developer. A small task took me 1 2 weeks to resolve as I learned everything through trial and error, so I am not afraid of any new challenges and functionality to be implemented after conducting extensive research.",
          ),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 350),
          child: const ExperienceEraCard(
            icon: Icons.flutter_dash,
            title: 'The Flutter Transition',
            description:
                "Hybrid Mobile Application development. I was given the opportunity to build a hybrid application that supported both Android and iOS platforms. I accepted the challenge and began developing the application in react native. However, I soon realised that react required me to learn a lot of new languages that took me longer to understand than flutter, so I came up with the idea to develop the application in flutter and completed it in two months.",
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
                  value: '8+',
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
            title: 'The iOS Era (2016-2020)',
            description:
                "It all began soon after I realised my interest in computers. Today, I'm interested in iOS development because of the high number of iOS users in large domestic demographic, as well as Apple's customer-friendly attitude. Learning Swift and understanding the inner workings of app development has been a lot of fun for me. It's a fascinating tale. When I was growing up, I was used to using Windows computers and was comfortable with the Windows environment, so seeing someone using the Mac Operating System was unusual. When I was in college, one of my friends brought his MacBook Air, and I had the opportunity to handle it, but to be honest, I had no idea how to use it because everything was disregarded as coming from a Windows environment. This piqued my interest in learning more about the Apple ecosystem, and I fell in love with it, thus my journey began. When it comes to iOS programming, The first few years were quite difficult. I'm not sure where to begin, and I don't have a Mac system to work with. Fortunately, I was able to obtain my own Mac Mini, and things became much easier. As I come from an area where I am aware of the lack of senior resources to assist me, I chose an out of the box track for me with the same effects on any simpler task where I can get stuck, which is very heartbreaking for a fresher developer. A small task took me 1 2 weeks to resolve as I learned everything through trial and error, so I am not afraid of any new challenges and functionality to be implemented after conducting extensive research.",
          ),
        ),
        const SizedBox(height: AppConstants.spacing24),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 350),
          child: const ExperienceEraCard(
            icon: Icons.flutter_dash,
            title: 'The Flutter Transition',
            description:
                "Hybrid Mobile Application development. I was given the opportunity to build a hybrid application that supported both Android and iOS platforms. I accepted the challenge and began developing the application in react native. However, I soon realised that react required me to learn a lot of new languages that took me longer to understand than flutter, so I came up with the idea to develop the application in flutter and completed it in two months.",
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
                      value: '8+',
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
                  title: 'The iOS Era (2016-2020)',
                  description:
                      "It all began soon after I realised my interest in computers. Today, I'm interested in iOS development because of the high number of iOS users in large domestic demographic, as well as Apple's customer-friendly attitude. Learning Swift and understanding the inner workings of app development has been a lot of fun for me. It's a fascinating tale. When I was growing up, I was used to using Windows computers and was comfortable with the Windows environment, so seeing someone using the Mac Operating System was unusual. When I was in college, one of my friends brought his MacBook Air, and I had the opportunity to handle it, but to be honest, I had no idea how to use it because everything was disregarded as coming from a Windows environment. This piqued my interest in learning more about the Apple ecosystem, and I fell in love with it, thus my journey began. When it comes to iOS programming, The first few years were quite difficult. I'm not sure where to begin, and I don't have a Mac system to work with. Fortunately, I was able to obtain my own Mac Mini, and things became much easier. As I come from an area where I am aware of the lack of senior resources to assist me, I chose an out of the box track for me with the same effects on any simpler task where I can get stuck, which is very heartbreaking for a fresher developer. A small task took me 1 2 weeks to resolve as I learned everything through trial and error, so I am not afraid of any new challenges and functionality to be implemented after conducting extensive research.",
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
                  title: 'The Flutter Transition',
                  description:
                      "Hybrid Mobile Application development. I was given the opportunity to build a hybrid application that supported both Android and iOS platforms. I accepted the challenge and began developing the application in react native. However, I soon realised that react required me to learn a lot of new languages that took me longer to understand than flutter, so I came up with the idea to develop the application in flutter and completed it in two months.",
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
