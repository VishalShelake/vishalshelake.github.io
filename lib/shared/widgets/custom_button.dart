import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../core/constants/app_constants.dart';

/// Custom button component with multiple styles
class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonStyle buttonStyle;
  final IconData? icon;
  final bool iconRight;
  final double? width;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonStyle = ButtonStyle.primary,
    this.icon,
    this.iconRight = false,
    this.width,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: AppConstants.animationNormal),
        curve: Curves.easeInOut,
        width: widget.width,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: widget.buttonStyle == ButtonStyle.primary
                    ? AppConstants.spacing24
                    : AppConstants.spacing16,
                vertical: widget.buttonStyle == ButtonStyle.primary
                    ? AppConstants.spacing16
                    : AppConstants.spacing12,
              ),
              decoration: _getButtonDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null && !widget.iconRight) ...[
                    Icon(
                      widget.icon,
                      size: 18,
                      color: _getTextColor(),
                    ),
                    const SizedBox(width: AppConstants.spacing8),
                  ],
                  Text(
                    widget.text,
                    style: widget.buttonStyle == ButtonStyle.primary
                        ? AppTypography.button
                        : AppTypography.buttonSmall,
                  ),
                  if (widget.icon != null && widget.iconRight) ...[
                    const SizedBox(width: AppConstants.spacing8),
                    Icon(
                      widget.icon,
                      size: 18,
                      color: _getTextColor(),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _getButtonDecoration() {
    switch (widget.buttonStyle) {
      case ButtonStyle.primary:
        return BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primaryBlue.withOpacity(0.4),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        );

      case ButtonStyle.secondary:
        return BoxDecoration(
          border: Border.all(
            color: _isHovered
                ? AppColors.primaryBlue
                : AppColors.textSecondary.withOpacity(0.3),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          color: _isHovered
              ? AppColors.primaryBlue.withOpacity(0.1)
              : Colors.transparent,
        );

      case ButtonStyle.text:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          color: _isHovered
              ? AppColors.cardBackground.withOpacity(0.3)
              : Colors.transparent,
        );
    }
  }

  Color _getTextColor() {
    switch (widget.buttonStyle) {
      case ButtonStyle.primary:
        return AppColors.textPrimary;
      case ButtonStyle.secondary:
      case ButtonStyle.text:
        return _isHovered ? AppColors.textPrimary : AppColors.textSecondary;
    }
  }
}

enum ButtonStyle {
  primary,
  secondary,
  text,
}
