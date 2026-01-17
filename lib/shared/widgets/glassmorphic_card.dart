import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';

/// A reusable glassmorphic card component with blur, semi-transparent background,
/// and iOS 26-style liquid glass spotlight effect that follows mouse position.
class GlassmorphicCard extends StatefulWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final bool enableHover;
  final bool enableSpotlight;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double blurAmount;

  const GlassmorphicCard({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.borderRadius = AppConstants.radiusXLarge,
    this.enableHover = false,
    this.enableSpotlight = true,
    this.onTap,
    this.backgroundColor,
    this.blurAmount = AppConstants.blurMedium,
  });

  @override
  State<GlassmorphicCard> createState() => _GlassmorphicCardState();
}

class _GlassmorphicCardState extends State<GlassmorphicCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  Offset _mousePosition = Offset.zero;
  Offset _lastMousePosition = Offset.zero;

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _onEnter() {
    setState(() {
      _isHovered = true;
    });
    _fadeController.forward();
  }

  void _onExit() {
    setState(() {
      _isHovered = false;
      // Keep last mouse position for fade-out animation
      _lastMousePosition = _mousePosition;
    });
    _fadeController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onEnter(),
      onExit: (_) => _onExit(),
      onHover: widget.enableSpotlight
          ? (event) => setState(() {
                _mousePosition = event.localPosition;
                _lastMousePosition = event.localPosition;
              })
          : null,
      child: GestureDetector(
        onTap: widget.onTap,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return AnimatedContainer(
              duration:
                  const Duration(milliseconds: AppConstants.animationNormal),
              curve: Curves.easeInOut,
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(
                  color: _isHovered
                      ? AppColors.primaryBlue.withOpacity(0.3)
                      : Colors.white.withOpacity(0.05),
                  width: 1.5,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadowDark,
                    blurRadius: 24,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: widget.blurAmount,
                    sigmaY: widget.blurAmount,
                  ),
                  child: Stack(
                    children: [
                      // Base gradient background
                      Container(
                        padding: widget.padding ??
                            const EdgeInsets.all(AppConstants.spacing24),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              widget.backgroundColor?.withOpacity(0.6) ??
                                  AppColors.cardBackground
                                      .withOpacity(_isHovered ? 0.8 : 0.6),
                              widget.backgroundColor?.withOpacity(0.4) ??
                                  AppColors.cardBackground
                                      .withOpacity(_isHovered ? 0.7 : 0.4),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.05),
                            width: 1,
                          ),
                        ),
                        child: widget.child,
                      ),

                      // Mouse-following spotlight overlay with smooth fade
                      if (widget.enableSpotlight)
                        Positioned.fill(
                          child: IgnorePointer(
                            child: FadeTransition(
                              opacity: _fadeAnimation,
                              child: LayoutBuilder(
                                builder: (context, spotlightConstraints) {
                                  final width = spotlightConstraints.maxWidth;
                                  final height = spotlightConstraints.maxHeight;

                                  // Use last position for smooth fade-out
                                  final position = _isHovered
                                      ? _mousePosition
                                      : _lastMousePosition;

                                  // Calculate alignment from mouse position
                                  final alignX = width > 0
                                      ? (position.dx / width) * 2 - 1
                                      : 0.0;
                                  final alignY = height > 0
                                      ? (position.dy / height) * 2 - 1
                                      : 0.0;

                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          widget.borderRadius),
                                      gradient: RadialGradient(
                                        center: Alignment(
                                          alignX.clamp(-1.0, 1.0),
                                          alignY.clamp(-1.0, 1.0),
                                        ),
                                        radius: 0.6, // Smaller, more subtle
                                        colors: const [
                                          Color(
                                              0x20FFFFFF), // Subtle white glow
                                          Color(0x104A7EFF), // Very faint blue
                                          Colors.transparent,
                                        ],
                                        stops: const [0.0, 0.3, 1.0],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                      // Top edge highlight for glass effect
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 1,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                AppColors.liquidGlassHighlight,
                                Colors.transparent,
                              ],
                              stops: [0.0, 0.5, 1.0],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
