import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../shared/widgets/nav_bar.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/responsive_utils.dart';
import '../../../core/services/logger_service.dart';
import '../data/models/project_model.dart';
import 'widgets/tech_stack_badge.dart';
import 'widgets/project_section.dart';
import 'widgets/metric_card.dart';
import 'widgets/code_display.dart';

/// Detailed project view with comprehensive information
class ProjectDetailScreen extends StatefulWidget {
  final ProjectModel project;

  const ProjectDetailScreen({
    super.key,
    required this.project,
  });

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logger = LoggerService();
    logger.logScreenView('Project Detail Screen',
        params: {'project': widget.project.title});

    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navigation bar
            NavBar(
              currentIndex: 2, // Projects tab
              onItemTap: (index) {
                logger.logNavigation('Project Detail', 'Projects',
                    isBack: true);
                Navigator.pop(context);
              },
            ),

            // Main content
            Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: ResponsiveUtils.getMaxContentWidth(context),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveUtils.getResponsivePadding(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppConstants.spacing32),

                    // Back button
                    FadeInLeft(
                      duration: const Duration(milliseconds: 400),
                      child: _buildBackButton(context),
                    ),

                    const SizedBox(height: AppConstants.spacing32),

                    // Main layout
                    if (isMobile || isTablet)
                      _buildMobileLayout()
                    else
                      _buildDesktopLayout(),

                    const SizedBox(height: AppConstants.spacing64),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    final logger = LoggerService();
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          logger.logNavigation('Project Detail', 'Projects', isBack: true);
          Navigator.pop(context);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.arrow_back,
              size: 20,
              color: AppColors.primaryBlue,
            ),
            const SizedBox(width: AppConstants.spacing8),
            Text(
              'Back to Projects',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          child: _buildProjectOverview(),
        ),
        const SizedBox(height: AppConstants.spacing32),
        FadeInUp(
          duration: const Duration(milliseconds: 600),
          delay: const Duration(milliseconds: 100),
          child: _buildMainContent(),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main content (left)
        Expanded(
          flex: 2,
          child: FadeInLeft(
            duration: const Duration(milliseconds: 600),
            child: _buildMainContent(),
          ),
        ),

        const SizedBox(width: AppConstants.spacing32),

        // Sidebar (right)
        Expanded(
          flex: 1,
          child: FadeInRight(
            duration: const Duration(milliseconds: 600),
            delay: const Duration(milliseconds: 200),
            child: _buildProjectOverview(),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectOverview() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(
          color: AppColors.borderColor,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(AppConstants.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Project Overview',
            style: AppTypography.h3.copyWith(fontSize: 20),
          ),
          const SizedBox(height: AppConstants.spacing16),
          Text(
            widget.project.title,
            style: AppTypography.h4.copyWith(
              fontSize: 18,
              color: AppColors.primaryBlue,
            ),
          ),
          const SizedBox(height: AppConstants.spacing16),
          Text(
            widget.project.fullDescription,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),

          const SizedBox(height: AppConstants.spacing24),
          const Divider(color: AppColors.borderColor),
          const SizedBox(height: AppConstants.spacing24),

          // Tech stack
          Text(
            'Tech Stack',
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppConstants.spacing12),

          if (widget.project.organizedTechStack.isNotEmpty)
            ...widget.project.organizedTechStack.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppConstants.spacing16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.primaryBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: AppConstants.spacing8),
                    ...entry.value.map((tech) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          '• $tech',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              );
            }).toList()
          else
            Wrap(
              spacing: AppConstants.spacing8,
              runSpacing: AppConstants.spacing8,
              children: widget.project.techStack
                  .map((tech) => TechStackBadge(label: tech))
                  .toList(),
            ),

          if (widget.project.githubUrl != null ||
              widget.project.demoUrl != null) ...[
            const SizedBox(height: AppConstants.spacing24),
            const Divider(color: AppColors.borderColor),
            const SizedBox(height: AppConstants.spacing24),

            // Action buttons
            if (widget.project.githubUrl != null)
              _buildActionButton(
                label: 'View on GitHub',
                icon: Icons.code,
              ),
            if (widget.project.githubUrl != null &&
                widget.project.demoUrl != null)
              const SizedBox(height: AppConstants.spacing12),
            if (widget.project.demoUrl != null)
              _buildActionButton(
                label: 'View Demo',
                icon: Icons.open_in_new,
                isPrimary: true,
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    bool isPrimary = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: AppConstants.spacing12,
      ),
      decoration: BoxDecoration(
        color: isPrimary ? AppColors.primaryBlue : Colors.transparent,
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        border: Border.all(
          color: AppColors.primaryBlue,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 18,
            color: isPrimary ? AppColors.textPrimary : AppColors.primaryBlue,
          ),
          const SizedBox(width: AppConstants.spacing8),
          Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              color: isPrimary ? AppColors.textPrimary : AppColors.primaryBlue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Screenshots section
        if (widget.project.screenshots.isNotEmpty)
          FadeInUp(
            duration: const Duration(milliseconds: 600),
            child: ProjectSection(
              title: 'App Screenshots',
              icon: Icons.smartphone,
              child: _buildScreenshotsSection(),
            ),
          ),

        if (widget.project.screenshots.isNotEmpty)
          const SizedBox(height: AppConstants.spacing32),

        // The Challenge section
        if (widget.project.challenge != null)
          FadeInUp(
            duration: const Duration(milliseconds: 600),
            child: ProjectSection(
              title: 'The Challenge',
              emoji: '💡',
              child: Text(
                widget.project.challenge!,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.7,
                ),
              ),
            ),
          ),

        if (widget.project.challenge != null)
          const SizedBox(height: AppConstants.spacing32),

        // Features section
        if (widget.project.features.isNotEmpty)
          FadeInUp(
            duration: const Duration(milliseconds: 600),
            delay: const Duration(milliseconds: 100),
            child: ProjectSection(
              title: 'Key Features',
              icon: Icons.star_outline,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.project.features
                    .map((feature) => Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppConstants.spacing12,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                size: 20,
                                color: AppColors.primaryBlue,
                              ),
                              const SizedBox(width: AppConstants.spacing12),
                              Expanded(
                                child: Text(
                                  feature,
                                  style: AppTypography.bodyMedium.copyWith(
                                    color: AppColors.textSecondary,
                                    height: 1.6,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),

        if (widget.project.features.isNotEmpty)
          const SizedBox(height: AppConstants.spacing32),

        // Architecture & Tech Stack section (detailed)
        if (widget.project.organizedTechStack.isNotEmpty)
          FadeInUp(
            duration: const Duration(milliseconds: 600),
            delay: const Duration(milliseconds: 200),
            child: ProjectSection(
              title: 'Architecture & Tech Stack',
              icon: Icons.layers_outlined,
              child: _buildTechStackGrid(),
            ),
          ),

        if (widget.project.organizedTechStack.isNotEmpty)
          const SizedBox(height: AppConstants.spacing32),

        // Code/AI Integration section
        if (widget.project.codeSnippet != null)
          FadeInUp(
            duration: const Duration(milliseconds: 600),
            delay: const Duration(milliseconds: 300),
            child: ProjectSection(
              title: 'Code Example',
              icon: Icons.code,
              child: CodeDisplay(
                code: widget.project.codeSnippet!,
                language: widget.project.codeLanguage,
              ),
            ),
          ),

        if (widget.project.codeSnippet != null)
          const SizedBox(height: AppConstants.spacing32),

        // Key Results section
        if (widget.project.metrics.isNotEmpty)
          FadeInUp(
            duration: const Duration(milliseconds: 600),
            delay: const Duration(milliseconds: 400),
            child: ProjectSection(
              title: 'Key Results',
              emoji: '📊',
              child: _buildMetricsGrid(),
            ),
          ),
      ],
    );
  }

  Widget _buildTechStackGrid() {
    return Wrap(
      spacing: AppConstants.spacing16,
      runSpacing: AppConstants.spacing16,
      children: widget.project.organizedTechStack.entries.map((entry) {
        return Container(
          padding: const EdgeInsets.all(AppConstants.spacing16),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            border: Border.all(
              color: AppColors.borderColor,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                entry.key,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.primaryBlue,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: AppConstants.spacing8),
              ...entry.value.map((tech) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    tech,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMetricsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppConstants.spacing16,
        mainAxisSpacing: AppConstants.spacing16,
        childAspectRatio: 1.2,
      ),
      itemCount: widget.project.metrics.length,
      itemBuilder: (context, index) {
        return MetricCard(
          metric: widget.project.metrics[index],
          index: index,
        );
      },
    );
  }

  Widget _buildScreenshotsSection() {
    return SizedBox(
      height: 420, // Increased slightly for scrollbar
      child: RawScrollbar(
        controller: _scrollController,
        thumbColor: AppColors.primaryBlue.withOpacity(0.3),
        radius: const Radius.circular(AppConstants.radiusXLarge),
        thickness: 6,
        thumbVisibility: true,
        trackVisibility: true,
        trackColor: Colors.white.withOpacity(0.05),
        trackBorderColor: Colors.transparent,
        trackRadius: const Radius.circular(AppConstants.radiusXLarge),
        child: ListView.separated(
          controller: _scrollController,
          padding: const EdgeInsets.only(bottom: 12), // Padding for scrollbar
          scrollDirection: Axis.horizontal,
          itemCount: widget.project.screenshots.length,
          separatorBuilder: (context, index) =>
              const SizedBox(width: AppConstants.spacing16),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                border: Border.all(
                  color: AppColors.borderColor,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                child: Image.asset(
                  widget.project.screenshots[index],
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 200,
                      color: AppColors.surfaceLight,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.broken_image,
                        size: 40,
                        color: AppColors.textSecondary,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
