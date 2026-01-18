import 'package:flutter/material.dart';
import '../services/logger_service.dart';
import '../services/analytics_service.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/timeline/presentation/timeline_screen.dart';
import '../../features/projects/presentation/projects_screen.dart';
import '../../features/about_me/presentation/about_me_screen.dart';
import '../../features/contact/presentation/contact_screen.dart';

/// Centralized navigation handler for the application
class AppNavigation {
  /// Navigates to the screen at the specified [index]
  static void navigateTo(
    BuildContext context,
    int index, {
    required int currentIndex,
  }) {
    if (index == currentIndex) return;

    final logger = LoggerService();
    final analytics = AnalyticsService();
    final destinationName = _getScreenName(index);
    final sourceName = _getScreenName(currentIndex);

    if (index == 0) {
      // Home - Use special route that lets Home's internal animations play
      logger.logNavigation(sourceName, 'Home', isBack: true);
      analytics.logNavigation(sourceName, 'Home', isBack: true);
      analytics.logNavItemClick('Home', index);
      Navigator.pushAndRemoveUntil(
        context,
        _createHomeRoute(const HomeScreen()),
        (route) => false,
      );
    } else {
      // Sibling navigation
      final destinations = [
        null, // 0: Home (handled above)
        const TimelineScreen(), // 1: Experience
        const ProjectsScreen(), // 2: Projects
        const AboutMeScreen(), // 3: About Me
        const ContactScreen(), // 4: Contact
      ];

      final destinationScreen = destinations[index];
      if (destinationScreen != null) {
        logger.logNavigation(sourceName, destinationName);
        analytics.logNavigation(sourceName, destinationName);
        analytics.logNavItemClick(destinationName, index);

        // If we are at Home (currentIndex 0), we push the new screen.
        // If we are already on a sibling screen (currentIndex > 0), we replace it
        // so that the back button always goes back to Home.
        if (currentIndex == 0) {
          Navigator.push(
            context,
            _createRoute(destinationScreen),
          );
        } else {
          Navigator.pushReplacement(
            context,
            _createRoute(destinationScreen),
          );
        }
      }
    }
  }

  /// Route for sibling screens - fades in the new page
  static Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  /// Route for Home screen - fades OUT old screen, new screen appears instantly
  /// This allows Home's internal animations (FadeInUp, etc.) to play
  static Route _createHomeRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Fade out the OLD screen (using secondaryAnimation on exit)
        // New screen appears immediately (opacity: 1.0) so its internal animations play
        return Stack(
          children: [
            // The new page - always fully visible
            child,
            // Fading overlay to create smooth exit effect for old content
            // IgnorePointer ensures this doesn't block touch events after fading
            IgnorePointer(
              child: FadeTransition(
                opacity: Tween<double>(begin: 1.0, end: 0.0).animate(animation),
                child: Container(
                    color: const Color(0xFF0A0A0F)), // Match background
              ),
            ),
          ],
        );
      },
      transitionDuration: const Duration(milliseconds: 250),
    );
  }

  static String _getScreenName(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Timeline';
      case 2:
        return 'Projects';
      case 3:
        return 'About Me';
      case 4:
        return 'Contact';
      default:
        return 'Unknown';
    }
  }
}
