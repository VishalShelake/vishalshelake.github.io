import 'package:flutter/material.dart';
import 'analytics_service.dart';
import 'logger_service.dart';

/// Mixin that provides automatic analytics tracking for screens.
///
/// This mixin handles:
/// - Screen view tracking on init
/// - Time-on-screen tracking on dispose
/// - Scroll depth tracking (25%, 50%, 75%, 100%)
///
/// Usage:
/// ```dart
/// class _MyScreenState extends State<MyScreen> with AnalyticsScreenMixin {
///   @override
///   String get screenName => 'My Screen';
///
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       body: buildScrollableBody(
///         child: YourScrollableContent(),
///       ),
///     );
///   }
/// }
/// ```
mixin AnalyticsScreenMixin<T extends StatefulWidget> on State<T> {
  /// Override this to provide the screen name for analytics
  String get screenName;

  final AnalyticsService _analytics = AnalyticsService();
  final LoggerService _logger = LoggerService();
  DateTime? _screenEntryTime;
  final Set<int> _reportedScrollThresholds = {};

  @override
  void initState() {
    super.initState();
    _trackScreenView();
  }

  @override
  void dispose() {
    _trackTimeOnScreen();
    super.dispose();
  }

  /// Track screen view
  void _trackScreenView() {
    _logger.logScreenView('$screenName Screen');
    _analytics.logScreenView(screenName);
    _screenEntryTime = DateTime.now();
  }

  /// Track time spent on screen
  void _trackTimeOnScreen() {
    if (_screenEntryTime != null) {
      final duration = DateTime.now().difference(_screenEntryTime!).inSeconds;
      _analytics.logScreenTime(screenName, duration);
    }
  }

  /// Handle scroll notifications to track scroll depth
  void onScroll(ScrollNotification notification) {
    if (notification.metrics.maxScrollExtent > 0) {
      final percent = (notification.metrics.pixels /
              notification.metrics.maxScrollExtent *
              100)
          .round();
      for (final threshold in [25, 50, 75, 100]) {
        if (percent >= threshold &&
            !_reportedScrollThresholds.contains(threshold)) {
          _reportedScrollThresholds.add(threshold);
          _analytics.logScrollDepth(screenName, threshold);
        }
      }
    }
  }

  /// Wrap your scrollable content with this to enable scroll tracking
  Widget buildScrollableBody({required Widget child}) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        onScroll(notification);
        return false;
      },
      child: child,
    );
  }

  // ============ Helper Methods for Common Event Tracking ============

  /// Track a navigation event
  void trackNavigation(String destination, {bool isBack = false}) {
    _logger.logNavigation(screenName, destination, isBack: isBack);
    _analytics.logNavigation(screenName, destination, isBack: isBack);
  }

  /// Track a user interaction
  void trackInteraction(String action, {Map<String, dynamic>? context}) {
    _logger.logUserInteraction(action, context: context);
    _analytics.logEvent(action, params: context);
  }

  /// Track a filter change
  void trackFilterChange(String filterType, String value) {
    _logger.logUserInteraction('$filterType filter changed',
        context: {filterType: value});
    _analytics.logFilterChange(filterType, value);
  }

  /// Track a project click
  void trackProjectClick(String projectId, String projectName) {
    _logger.logUserInteraction('Project card tapped',
        context: {'project': projectName});
    _analytics.logProjectClick(projectId, projectName);
  }
}
