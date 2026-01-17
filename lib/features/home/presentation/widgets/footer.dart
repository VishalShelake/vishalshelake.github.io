import 'package:flutter/material.dart';
// Using built-in Flutter icons
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_vishal/core/theme/app_colors.dart';
import 'package:portfolio_vishal/core/theme/app_typography.dart';
import 'package:portfolio_vishal/core/constants/app_constants.dart';
import 'package:portfolio_vishal/core/utils/responsive_utils.dart';

/// Footer with copyright and social links
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.getResponsivePadding(context),
        vertical: AppConstants.spacing32,
      ),
      child: isMobile ? _buildMobileFooter() : _buildDesktopFooter(),
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCopyright(),
        _buildSocialLinks(),
      ],
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      children: [
        _buildSocialLinks(),
        const SizedBox(height: AppConstants.spacing16),
        _buildCopyright(),
      ],
    );
  }

  Widget _buildCopyright() {
    return Text(
      '© ${DateTime.now().year} ${AppConstants.portfolioName}. Developed with Flutter Web.',
      style: AppTypography.caption,
    );
  }

  Widget _buildSocialLinks() {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SocialIconButton(
          icon: Icons.link,
          url: AppConstants.linkedInUrl,
        ),
        SizedBox(width: AppConstants.spacing16),
        _SocialIconButton(
          icon: Icons.code,
          url: AppConstants.githubUrl,
        ),
        SizedBox(width: AppConstants.spacing16),
        _SocialIconButton(
          icon: Icons.close,
          url: AppConstants.twitterUrl,
        ),
      ],
    );
  }
}

class _SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String url;

  const _SocialIconButton({
    required this.icon,
    required this.url,
  });

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: AppConstants.animationFast),
          padding: const EdgeInsets.all(AppConstants.spacing8),
          child: Icon(
            widget.icon,
            size: 20,
            color: _isHovered ? AppColors.primaryBlue : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
