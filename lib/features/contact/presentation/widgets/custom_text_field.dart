import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';

/// Custom text field for contact form
class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final int maxLines;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.maxLines = 1,
    this.controller,
    this.keyboardType,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label.toUpperCase(),
          style: AppTypography.label.copyWith(
            color: AppColors.primaryBlue,
            fontSize: 11,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: AppConstants.spacing8),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: AppTypography.bodyMedium.copyWith(
              color: AppColors.textTertiary,
            ),
            filled: true,
            fillColor: AppColors.secondaryBackground,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppConstants.spacing16,
              vertical: widget.maxLines > 1
                  ? AppConstants.spacing16
                  : AppConstants.spacing12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
              borderSide: BorderSide(
                color: AppColors.borderColor,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
              borderSide: BorderSide(
                color: AppColors.borderColor,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
              borderSide: BorderSide(
                color: AppColors.primaryBlue,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
              borderSide: BorderSide(
                color: AppColors.accentOrange,
                width: 1.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
              borderSide: BorderSide(
                color: AppColors.accentOrange,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
