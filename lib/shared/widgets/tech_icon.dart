import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/constants/app_constants.dart';

/// Tech stack icon component with label
class TechIcon extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;
  final Color? backgroundColor;

  const TechIcon({
    super.key,
    required this.icon,
    required this.label,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  State<TechIcon> createState() => _TechIconState();
}

class _TechIconState extends State<TechIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        duration: Duration(milliseconds: AppConstants.animationFast),
        scale: _isHovered ? 1.05 : 1.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: widget.backgroundColor ??
                    AppColors.secondaryBackground.withOpacity(0.6),
                borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                border: Border.all(
                  color: _isHovered
                      ? AppColors.primaryBlue.withOpacity(0.5)
                      : Colors.white.withOpacity(0.05),
                  width: 1,
                ),
              ),
              child: Icon(
                widget.icon,
                size: 32,
                color: widget.iconColor ?? AppColors.primaryBlue,
              ),
            ),
            const SizedBox(height: AppConstants.spacing8),
            Text(
              widget.label,
              style: AppTypography.label,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
