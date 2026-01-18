import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../shared/widgets/nav_bar.dart';
import '../../../shared/widgets/grid_background.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/services/analytics_mixin.dart';
import '../../../core/navigation/app_navigation.dart';
import '../data/models/contact_model.dart';
import 'widgets/contact_form_card.dart';
import 'widgets/social_connection_card.dart';
import 'widgets/location_card.dart';
import 'widgets/availability_card.dart';
import 'widgets/direct_inquiry_card.dart';

/// Contact screen with form, social connections, and availability
class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with AnalyticsScreenMixin {
  @override
  String get screenName => 'Contact';

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final socialConnections = SocialConnection.getSocialConnections();
    final location = LocationInfo.getCurrentLocation();

    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Stack(
        children: [
          // Decorative grid background
          const GridBackground(),

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
                    const SizedBox(height: AppConstants.spacing48),

                    // Page header
                    FadeInDown(
                      duration: const Duration(milliseconds: 600),
                      child: _buildPageHeader(),
                    ),

                    const SizedBox(height: AppConstants.spacing48),

                    // Content grid
                    if (isMobile)
                      _buildMobileLayout(socialConnections, location)
                    else
                      _buildDesktopLayout(socialConnections, location),

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
              currentIndex: 4,
              onItemTap: (index) {
                AppNavigation.navigateTo(
                  context,
                  index,
                  currentIndex: 4,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageHeader() {
    return Column(
      children: [
        Text(
          'Let\'s Connect',
          style: AppTypography.h1.copyWith(
            fontSize: 40,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppConstants.spacing16),
        Text(
          'Whether you have a project in mind or just want to chat about mobile development,\nI\'d love to hear from you.',
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildMobileLayout(
    List<SocialConnection> socialConnections,
    LocationInfo location,
  ) {
    return Column(
      children: [
        // Contact form
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          child: const ContactFormCard(),
        ),

        const SizedBox(height: AppConstants.spacing24),

        // Social connections section
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 100),
          child: _buildSocialSection(socialConnections),
        ),

        const SizedBox(height: AppConstants.spacing24),

        // Location card
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 200),
          child: LocationCard(location: location),
        ),

        const SizedBox(height: AppConstants.spacing24),

        // Availability card
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 300),
          child: const AvailabilityCard(),
        ),

        const SizedBox(height: AppConstants.spacing24),

        // Direct inquiry card
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 400),
          child: const DirectInquiryCard(),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(
    List<SocialConnection> socialConnections,
    LocationInfo location,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left column (contact form)
        Expanded(
          flex: 1,
          child: FadeInLeft(
            duration: const Duration(milliseconds: 600),
            child: const ContactFormCard(),
          ),
        ),

        const SizedBox(width: AppConstants.spacing24),

        // Right column (other sections)
        Expanded(
          flex: 1,
          child: Column(
            children: [
              // Social connections
              FadeInRight(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 100),
                child: _buildSocialSection(socialConnections),
              ),

              const SizedBox(height: AppConstants.spacing24),

              // Location card
              FadeInRight(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 200),
                child: LocationCard(location: location),
              ),

              const SizedBox(height: AppConstants.spacing24),

              // Availability card
              FadeInRight(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 300),
                child: const AvailabilityCard(),
              ),

              const SizedBox(height: AppConstants.spacing24),

              // Direct inquiry card
              FadeInRight(
                duration: const Duration(milliseconds: 600),
                delay: const Duration(milliseconds: 400),
                child: const DirectInquiryCard(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialSection(List<SocialConnection> socialConnections) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.only(
            left: AppConstants.spacing8,
            bottom: AppConstants.spacing16,
          ),
          child: Row(
            children: [
              Icon(
                Icons.share,
                size: 20,
                color: AppColors.primaryBlue,
              ),
              const SizedBox(width: AppConstants.spacing8),
              Text(
                'SOCIAL CONNECTIONS',
                style: AppTypography.label.copyWith(
                  color: AppColors.primaryBlue,
                  fontSize: 11,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),

        // Social connection cards
        ...socialConnections.map(
          (connection) => Padding(
            padding: const EdgeInsets.only(bottom: AppConstants.spacing12),
            child: SocialConnectionCard(connection: connection),
          ),
        ),
      ],
    );
  }
}
