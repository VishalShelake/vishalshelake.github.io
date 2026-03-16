import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../shared/widgets/glassmorphic_card.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/contact_model.dart';

/// Location card showing current base and timezone
class LocationCard extends StatefulWidget {
  final LocationInfo location;

  const LocationCard({
    super.key,
    required this.location,
  });

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  late Timer _timer;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateTime());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    final now = DateTime.now().toUtc().add(const Duration(hours: 5, minutes: 30));
    final hour = now.hour > 12 ? now.hour - 12 : (now.hour == 0 ? 12 : now.hour);
    final minute = now.minute.toString().padLeft(2, '0');
    final amPm = now.hour >= 12 ? 'PM' : 'AM';
    final newTime = '$hour:$minute $amPm';
    
    if (_currentTime != newTime) {
      if (mounted) {
        setState(() {
          _currentTime = newTime;
        });
      } else {
        _currentTime = newTime;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      padding: const EdgeInsets.all(AppConstants.spacing24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BASE label
          Text(
            'BASE',
            style: AppTypography.label.copyWith(
              color: AppColors.textSecondary,
              fontSize: 11,
              letterSpacing: 1.2,
            ),
          ),

          const SizedBox(height: AppConstants.spacing16),

          // City with indicator
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: AppConstants.spacing12),
              Expanded(
                child: Text(
                  widget.location.city,
                  style: AppTypography.h2.copyWith(
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppConstants.spacing12),

          // Timezone info
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.accentGreen,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: AppConstants.spacing8),
                Text(
                  '${widget.location.timezone} • $_currentTime',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
