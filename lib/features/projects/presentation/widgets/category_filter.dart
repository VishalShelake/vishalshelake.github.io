import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';

/// Horizontal scrollable category filter tabs
class CategoryFilter extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategoryFilter({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = category == selectedCategory;
          return Padding(
            padding: const EdgeInsets.only(right: AppConstants.spacing12),
            child: _buildCategoryTab(category, isSelected),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryTab(String category, bool isSelected) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onCategorySelected(category),
        child: AnimatedContainer(
          duration: Duration(milliseconds: AppConstants.animationFast),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.spacing20,
            vertical: AppConstants.spacing12,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            border: Border.all(
              color: isSelected
                  ? AppColors.primaryBlue
                  : AppColors.textSecondary.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Text(
            category,
            style: AppTypography.bodyMedium.copyWith(
              color:
                  isSelected ? AppColors.textPrimary : AppColors.textSecondary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
