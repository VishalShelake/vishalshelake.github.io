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
import '../data/models/project_model.dart';
import 'widgets/category_filter.dart';
import 'widgets/project_card.dart';
import 'project_detail_screen.dart';

/// Projects list screen ("Selected Work") with category filtering
class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen>
    with AnalyticsScreenMixin {
  @override
  String get screenName => 'Projects';

  String _selectedCategory = 'All';
  final List<String> _categories = ['All', 'Flutter', 'iOS', 'AI'];

  List<ProjectModel> get _filteredProjects {
    if (_selectedCategory == 'All') {
      return ProjectModel.sampleProjects;
    }
    return ProjectModel.sampleProjects
        .where((project) =>
            project.mainCategory == _selectedCategory ||
            project.categories.contains(_selectedCategory))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Scaffold(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppConstants.spacing48),

                    // Page header
                    FadeInDown(
                      duration: const Duration(milliseconds: 600),
                      child: _buildPageHeader(),
                    ),

                    const SizedBox(height: AppConstants.spacing32),

                    // Category filter
                    FadeInDown(
                      duration: const Duration(milliseconds: 600),
                      delay: const Duration(milliseconds: 200),
                      child: CategoryFilter(
                        categories: _categories,
                        selectedCategory: _selectedCategory,
                        onCategorySelected: (category) {
                          trackFilterChange('category', category);
                          setState(() {
                            _selectedCategory = category;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: AppConstants.spacing48),

                    // Projects grid
                    _buildProjectsGrid(isMobile),

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
              currentIndex: 2,
              onItemTap: (index) {
                AppNavigation.navigateTo(
                  context,
                  index,
                  currentIndex: 2,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selected Work',
          style: AppTypography.h1.copyWith(
            fontSize: 40,
          ),
        ),
        const SizedBox(height: AppConstants.spacing16),
        Text(
          'A collection of mobile applications and technical experiments\ncrafted with precision.',
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildProjectsGrid(bool isMobile) {
    final projects = _filteredProjects;

    if (projects.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.spacing48),
          child: Text(
            'No projects found in this category',
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    // Use LayoutBuilder to calculate card width for responsive grid
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = isMobile ? 1 : 2;
        final spacing = AppConstants.spacing24;
        final cardWidth =
            (constraints.maxWidth - (spacing * (crossAxisCount - 1))) /
                crossAxisCount;

        return SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: spacing,
            runSpacing: spacing,
            children: projects.asMap().entries.map((entry) {
              final index = entry.key;
              final project = entry.value;
              return SizedBox(
                width: cardWidth,
                child: ProjectCard(
                  project: project,
                  index: index,
                  onTap: () {
                    trackNavigation('Project Detail');
                    trackProjectClick(project.id, project.title);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProjectDetailScreen(
                          project: project,
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
