import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';

/// Direct inquiry card with prominent email CTA
class DirectInquiryCard extends StatefulWidget {
  const DirectInquiryCard({super.key});

  @override
  State<DirectInquiryCard> createState() => _DirectInquiryCardState();
}

class _DirectInquiryCardState extends State<DirectInquiryCard> {
  bool _isHovered = false;

  Future<void> _sendEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: AppConstants.emailAddress,
      query: 'subject=Project Inquiry',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryBlue,
              AppColors.primaryBlue.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(AppConstants.radiusXLarge),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryBlue.withOpacity(0.3),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background illustration
            Positioned(
              right: -20,
              top: -20,
              child: Icon(
                Icons.mail_outline,
                size: 120,
                color: Colors.white.withOpacity(0.1),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(AppConstants.spacing32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Direct Inquiry?',
                    style: AppTypography.h2.copyWith(
                      fontSize: 28,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: AppConstants.spacing12),

                  // Description
                  Text(
                    'Skip the forms and social media. Send me a direct email for urgent matters.',
                    style: AppTypography.bodyMedium.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: AppConstants.spacing24),

                  // Email button
                  AnimatedContainer(
                    duration:
                        Duration(milliseconds: AppConstants.animationNormal),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: _sendEmail,
                        borderRadius:
                            BorderRadius.circular(AppConstants.radiusMedium),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppConstants.spacing20,
                            vertical: AppConstants.spacing12,
                          ),
                          decoration: BoxDecoration(
                            color: _isHovered
                                ? Colors.white
                                : Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(
                                AppConstants.radiusMedium),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                AppConstants.emailAddress,
                                style: AppTypography.bodyMedium.copyWith(
                                  color: AppColors.primaryBlue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: AppConstants.spacing8),
                              Icon(
                                Icons.arrow_forward,
                                size: 18,
                                color: AppColors.primaryBlue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
