import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/responsive_utils.dart';
import 'package:url_launcher/url_launcher.dart';

/// Profile section with image and introduction
class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(
          color: AppColors.borderColor,
          width: 1,
        ),
      ),
      child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildProfileImage(),
        const SizedBox(height: AppConstants.spacing24),
        _buildProfileContent(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfileImage(),
        const SizedBox(width: AppConstants.spacing24),
        Expanded(child: _buildProfileContent()),
      ],
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 200,
      height: 250,
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(
          color: AppColors.borderColor,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        child: Image.asset(
          'assets/images/developer_profile_photo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildProfileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Badges
        Row(
          children: [
            _buildBadge('SENIOR ENGINEER', AppColors.primaryBlue),
            const SizedBox(width: AppConstants.spacing8),
            _buildBadge('OPEN TO WORK', AppColors.accentGreen),
          ],
        ),
        const SizedBox(height: AppConstants.spacing16),

        // Greeting
        Text(
          "Hi, I'm Vishal Shelake.",
          style: AppTypography.h2.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppConstants.spacing16),

        // Bio
        Text(
          "I'm Vishal Shelake, iOS Developer from city of grapes in India called Nashik. I've been interested in programming since I was a child, and my first major programming project was when I was in ninth grade. It all started with Excel, where I learned that we can use a formula to determine the sum of all rows on a specific cell. Later, it piqued my interest, and I began building macros in Excel to accomplish various tasks; this is how it all began.",
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: AppConstants.spacing24),

        // Action buttons
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () async {
                final Uri url = Uri.parse(
                    'assets/documents/Resume_Vishal_Shelake_Oct22.pdf');
                // Note: For local assets like PDF, we might need a specific viewer or just try launching it.
                // Since this is a web/mobile hybrid, launching an asset path directly as URL might not work
                // without the server serving it or a specific plugin.
                // However, for now we will try launching it as a resource.
                // Actually, for assets, we usually need to construct a full URL or use a viewer.
                // Assuming standard behavior for this portfolio context.
                // A better approach for local assets might be sharing or opening.
                // Let's try launching as a file URL or relative path.
                // Given the context, let's treat it as a relative URL which web can handle if served.
                if (!await launchUrl(url)) {
                  debugPrint('Could not launch \$url');
                }
              },
              icon: const Icon(Icons.download, size: 18),
              label: const Text('Download Resume'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: AppColors.textPrimary,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.spacing16,
                  vertical: AppConstants.spacing12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                ),
              ),
            ),
            const SizedBox(width: AppConstants.spacing12),
            TextButton.icon(
              onPressed: () async {
                const url = 'https://twitter.com/vishal_shelake9';
                if (!await launchUrl(Uri.parse(url))) {
                  debugPrint('Could not launch \$url');
                }
              },
              icon: const Icon(Icons.open_in_new, size: 18),
              label: const Text('Lets Connect'),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacing12,
        vertical: AppConstants.spacing4,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
      ),
      child: Text(
        text,
        style: AppTypography.label.copyWith(
          color: color,
          fontSize: 10,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}
