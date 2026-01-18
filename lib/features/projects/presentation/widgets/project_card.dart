import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../data/models/project_model.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../shared/widgets/glassmorphic_card.dart';
import 'tech_stack_badge.dart';

/// Project card widget for displaying projects in grid layout
/// Uses iOS 26-style liquid glass effect with mouse-following spotlight
class ProjectCard extends StatefulWidget {
  final ProjectModel project;
  final VoidCallback onTap;
  final int index;

  const ProjectCard({
    super.key,
    required this.project,
    required this.onTap,
    this.index = 0,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      delay: Duration(milliseconds: widget.index * 100),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: AppConstants.animationFast),
            transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
            child: GlassmorphicCard(
              enableHover: true,
              enableSpotlight: true,
              padding: EdgeInsets.zero,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project preview/hero image
                  _buildProjectPreview(),

                  // Content
                  Padding(
                    padding: const EdgeInsets.all(AppConstants.spacing20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Technology badges
                        _buildTechBadges(),

                        const SizedBox(height: AppConstants.spacing16),

                        // Project title
                        Text(
                          widget.project.title,
                          style: AppTypography.h4.copyWith(
                            fontSize: 20,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: AppConstants.spacing12),

                        // Short description
                        Text(
                          widget.project.shortDescription,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.6,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: AppConstants.spacing16),

                        // Action buttons
                        _buildActionButtons(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProjectPreview() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: _getGradientColor(),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppConstants.radiusXLarge),
          topRight: Radius.circular(AppConstants.radiusXLarge),
        ),
      ),
      child: widget.project.heroImage != null
          ? ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppConstants.radiusXLarge),
                topRight: Radius.circular(AppConstants.radiusXLarge),
              ),
              child: Image.asset(
                widget.project.heroImage!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      _getProjectIcon(),
                      size: 64,
                      color: AppColors.textPrimary.withOpacity(0.8),
                    ),
                  );
                },
              ),
            )
          : Center(
              child: Icon(
                _getProjectIcon(),
                size: 64,
                color: AppColors.textPrimary.withOpacity(0.8),
              ),
            ),
    );
  }

  Color _getGradientColor() {
    // Return different colors based on project category
    if (widget.project.mainCategory.toLowerCase().contains('flutter')) {
      return const Color(0xFF02569B).withOpacity(0.3);
    } else if (widget.project.mainCategory.toLowerCase().contains('ios')) {
      return const Color(0xFFFA7343).withOpacity(0.3);
    } else if (widget.project.mainCategory.toLowerCase().contains('ai')) {
      return const Color(0xFF10A37F).withOpacity(0.3);
    }
    return AppColors.primaryBlue.withOpacity(0.2);
  }

  IconData _getProjectIcon() {
    if (widget.project.mainCategory.toLowerCase().contains('flutter')) {
      return Icons.phone_android;
    } else if (widget.project.mainCategory.toLowerCase().contains('ios')) {
      return Icons.phone_iphone;
    } else if (widget.project.mainCategory.toLowerCase().contains('ai')) {
      return Icons.auto_awesome;
    }
    return Icons.code;
  }

  Widget _buildTechBadges() {
    final displayTechs = widget.project.categories.take(3).toList();
    return Wrap(
      spacing: AppConstants.spacing8,
      runSpacing: AppConstants.spacing8,
      children: displayTechs
          .map((tech) => TechStackBadge(label: tech, isSmall: true))
          .toList(),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildActionButton(
            label: 'View Details',
            icon: Icons.arrow_forward,
            isPrimary: true,
          ),
        ),
        if (widget.project.demoUrl != null) ...[
          const SizedBox(width: AppConstants.spacing8),
          _buildIconButton(Icons.play_circle_outline),
        ],
        if (widget.project.githubUrl != null) ...[
          const SizedBox(width: AppConstants.spacing8),
          _buildIconButton(Icons.code),
        ],
      ],
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    bool isPrimary = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacing12,
        vertical: AppConstants.spacing8,
      ),
      decoration: BoxDecoration(
        color: isPrimary
            ? AppColors.primaryBlue.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        border: Border.all(
          color: isPrimary
              ? AppColors.primaryBlue
              : AppColors.textSecondary.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTypography.bodySmall.copyWith(
              color:
                  isPrimary ? AppColors.primaryBlue : AppColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: AppConstants.spacing4),
          Icon(
            icon,
            size: 16,
            color: isPrimary ? AppColors.primaryBlue : AppColors.textSecondary,
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.spacing8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        border: Border.all(
          color: AppColors.textSecondary.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Icon(
        icon,
        size: 16,
        color: AppColors.textSecondary,
      ),
    );
  }
}
