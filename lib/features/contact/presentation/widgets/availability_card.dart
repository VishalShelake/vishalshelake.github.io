import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../shared/widgets/glassmorphic_card.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';

/// Availability card with booking options
class AvailabilityCard extends StatelessWidget {
  const AvailabilityCard({super.key});

  Future<void> _bookCall() async {
    // TODO: Add calendar booking link
    final uri = Uri.parse('https://calendly.com/example');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _copyEmail(BuildContext context) {
    Clipboard.setData(
      ClipboardData(text: AppConstants.emailAddress),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email copied to clipboard!'),
        backgroundColor: AppColors.accentGreen,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      backgroundColor: AppColors.secondaryBackground,
      padding: const EdgeInsets.all(AppConstants.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Badge
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.spacing12,
              vertical: AppConstants.spacing6,
            ),
            decoration: BoxDecoration(
              color: AppColors.accentGreen.withOpacity(0.1),
              border: Border.all(
                color: AppColors.accentGreen.withOpacity(0.3),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            ),
            child: Text(
              'AVAILABLE NOW',
              style: AppTypography.label.copyWith(
                color: AppColors.accentGreen,
                fontSize: 10,
                letterSpacing: 1.2,
              ),
            ),
          ),

          const SizedBox(height: AppConstants.spacing20),

          // Title
          Text(
            'Let\'s collaborate on\nyour next big idea',
            style: AppTypography.h3.copyWith(
              fontSize: 22,
              height: 1.3,
            ),
          ),

          const SizedBox(height: AppConstants.spacing12),

          // Description
          Text(
            'I am currently open for freelance consultation and full-time senior engineering roles. Let\'s schedule a 15-min discovery call.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),

          const SizedBox(height: AppConstants.spacing24),

          // Buttons
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  icon: Icons.calendar_today,
                  text: 'Book a Call',
                  onPressed: _bookCall,
                ),
              ),
              const SizedBox(width: AppConstants.spacing12),
              Expanded(
                child: _ActionButton(
                  icon: Icons.content_copy,
                  text: 'Copy Email',
                  onPressed: () => _copyEmail(context),
                  isSecondary: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final bool isSecondary;

  const _ActionButton({
    required this.icon,
    required this.text,
    required this.onPressed,
    this.isSecondary = false,
  });

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: Duration(milliseconds: AppConstants.animationNormal),
          padding: const EdgeInsets.all(AppConstants.spacing12),
          decoration: BoxDecoration(
            color: widget.isSecondary
                ? (_isHovered
                    ? AppColors.cardBackground
                    : AppColors.primaryBackground)
                : (_isHovered
                    ? AppColors.cardBackgroundHover
                    : AppColors.cardBackground),
            border: Border.all(
              color: AppColors.borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 16,
                color: AppColors.textSecondary,
              ),
              const SizedBox(width: AppConstants.spacing8),
              Text(
                widget.text,
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
