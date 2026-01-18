import 'package:flutter/material.dart';
import 'dart:ui';
// Using built-in Flutter icons
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/responsive_utils.dart';

/// Top navigation bar with logo and menu items
class NavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onItemTap;

  const NavBar({
    super.key,
    this.currentIndex = 0,
    required this.onItemTap,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int? _hoveredIndex;

  final List<String> _menuItems = [
    'Home',
    'Experience',
    'Projects',
    'About Me',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            // Semi-transparent background for glass effect
            color: AppColors.primaryBackground.withOpacity(0.3),
            // Subtle border at the bottom for definition
            border: Border(
              bottom: BorderSide(
                color: AppColors.textTertiary.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveUtils.getResponsivePadding(context),
            vertical: AppConstants.spacing24,
          ),
          child: Row(
            children: [
              // Logo
              _buildLogo(),

              const Spacer(),

              // Menu items
              if (!isMobile) _buildDesktopMenu(),

              // Mobile menu button
              if (isMobile) _buildMobileMenuButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
          ),
          child: const Center(
            child: Icon(
              Icons.code,
              size: 20,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(width: AppConstants.spacing12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppConstants.portfolioName.split(' ').first,
              style: AppTypography.h4.copyWith(fontSize: 16, height: 1.0),
            ),
            Text(
              AppConstants.portfolioTitle.toUpperCase(),
              style: AppTypography.label.copyWith(
                color: AppColors.primaryBlue,
                fontSize: 9,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopMenu() {
    return Row(
      children: List.generate(_menuItems.length, (index) {
        final isActive = widget.currentIndex == index;
        final isHovered = _hoveredIndex == index;

        return Padding(
          padding: const EdgeInsets.only(left: AppConstants.spacing32),
          child: MouseRegion(
            onEnter: (_) => setState(() => _hoveredIndex = index),
            onExit: (_) => setState(() => _hoveredIndex = null),
            child: GestureDetector(
              onTap: () => widget.onItemTap(index),
              child: AnimatedContainer(
                duration: Duration(milliseconds: AppConstants.animationFast),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.spacing16,
                  vertical: AppConstants.spacing8,
                ),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.primaryBlue
                      : (isHovered
                          ? AppColors.primaryBlue.withOpacity(0.1)
                          : Colors.transparent),
                  borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                ),
                child: Text(
                  _menuItems[index],
                  style: AppTypography.bodyMedium.copyWith(
                    color: isActive || isHovered
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildMobileMenuButton() {
    return IconButton(
      icon: const Icon(Icons.menu),
      color: AppColors.textPrimary,
      onPressed: () => _showMobileMenu(),
    );
  }

  void _showMobileMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppConstants.radiusLarge),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.spacing24,
          vertical: AppConstants.spacing32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.textTertiary.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: AppConstants.spacing24),
            // Menu items
            ...List.generate(_menuItems.length, (index) {
              final isActive = widget.currentIndex == index;
              return ListTile(
                leading: Icon(
                  _getMenuIcon(index),
                  color: isActive
                      ? AppColors.primaryBlue
                      : AppColors.textSecondary,
                ),
                title: Text(
                  _menuItems[index],
                  style: AppTypography.bodyLarge.copyWith(
                    color: isActive
                        ? AppColors.primaryBlue
                        : AppColors.textPrimary,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                trailing: isActive
                    ? Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryBlue,
                        ),
                      )
                    : null,
                onTap: () {
                  Navigator.pop(context); // Close bottom sheet first
                  widget.onItemTap(index);
                },
              );
            }),
            const SizedBox(height: AppConstants.spacing16),
          ],
        ),
      ),
    );
  }

  IconData _getMenuIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home_outlined;
      case 1:
        return Icons.timeline_outlined;
      case 2:
        return Icons.work_outline;
      case 3:
        return Icons.person_outline;
      case 4:
        return Icons.email_outlined;
      default:
        return Icons.circle_outlined;
    }
  }
}
