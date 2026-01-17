import 'package:flutter/material.dart';
import '../../../../shared/widgets/glassmorphic_card.dart';
import '../../../../shared/widgets/custom_button.dart' as custom;
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/logger_service.dart';
import 'custom_text_field.dart';

/// Contact form card with name, email, and message fields
class ContactFormCard extends StatefulWidget {
  const ContactFormCard({super.key});

  @override
  State<ContactFormCard> createState() => _ContactFormCardState();
}

class _ContactFormCardState extends State<ContactFormCard> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final logger = LoggerService();

    if (_formKey.currentState?.validate() ?? false) {
      // Log successful form submission
      logger.logFormSubmission('Contact form', data: {
        'hasName': _nameController.text.isNotEmpty,
        'hasEmail': _emailController.text.isNotEmpty,
        'hasMessage': _messageController.text.isNotEmpty,
      });

      // TODO: Implement form submission
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Message sent successfully!'),
          backgroundColor: AppColors.accentGreen,
        ),
      );
      // Clear form
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    } else {
      // Log form validation failure
      logger.logWarning('Contact form validation failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return GlassmorphicCard(
      padding: const EdgeInsets.all(AppConstants.spacing32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Get in Touch',
              style: AppTypography.h2.copyWith(
                fontSize: 32,
              ),
            ),

            const SizedBox(height: AppConstants.spacing12),

            Text(
              'Have a project in mind or just want to discuss the latest in Flutter?\nDrop me a line.',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),

            const SizedBox(height: AppConstants.spacing32),

            // Name and Email fields
            if (isMobile) ...[
              CustomTextField(
                label: 'Name',
                hint: 'John Doe',
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppConstants.spacing20),
              CustomTextField(
                label: 'Email',
                hint: 'john@example.com',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
            ] else ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'Name',
                      hint: 'John Doe',
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: AppConstants.spacing20),
                  Expanded(
                    child: CustomTextField(
                      label: 'Email',
                      hint: 'john@example.com',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: AppConstants.spacing20),

            // Message field
            CustomTextField(
              label: 'Message',
              hint: 'Tell me about your project...',
              controller: _messageController,
              maxLines: 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a message';
                }
                return null;
              },
            ),

            const SizedBox(height: AppConstants.spacing32),

            // Submit button
            custom.CustomButton(
              text: 'Send Message',
              icon: Icons.arrow_forward,
              iconRight: true,
              buttonStyle: custom.ButtonStyle.primary,
              onPressed: _handleSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
