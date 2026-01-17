import 'package:logger/logger.dart';

/// Centralized logging service for tracking user activities and app events
///
/// This service provides a singleton instance for consistent logging across the app.
/// It includes helper methods for common logging patterns:
/// - Navigation tracking
/// - User interaction tracking
/// - Form submission tracking
/// - Error logging
class LoggerService {
  static final LoggerService _instance = LoggerService._internal();
  late final Logger _logger;

  factory LoggerService() {
    return _instance;
  }

  LoggerService._internal() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0, // Don't include call stack
        errorMethodCount: 5, // Include call stack for errors
        lineLength: 80,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
      level: Level.debug, // Show debug and above in development
    );
  }

  /// Initialize the logger service
  /// Call this in main() before running the app
  static void initialize() {
    LoggerService();
  }

  /// Log navigation events between screens
  ///
  /// Example: logNavigation('Home', 'Timeline')
  void logNavigation(String from, String to, {bool isBack = false}) {
    final direction = isBack ? 'back' : 'forward';
    _logger.i('Navigation: $from -> $to ($direction)');
  }

  /// Log screen view events
  ///
  /// Example: logScreenView('Home Screen')
  void logScreenView(String screenName, {Map<String, dynamic>? params}) {
    final paramsStr = params != null ? ' | Params: $params' : '';
    _logger.i('Screen View: $screenName$paramsStr');
  }

  /// Log user interactions (button clicks, card taps, etc.)
  ///
  /// Example: logUserInteraction('Profile Card clicked')
  void logUserInteraction(String action, {Map<String, dynamic>? context}) {
    final contextStr = context != null ? ' | Context: $context' : '';
    _logger.d('User Interaction: $action$contextStr');
  }

  /// Log form submissions
  ///
  /// Example: logFormSubmission('Contact form')
  void logFormSubmission(String formName, {Map<String, dynamic>? data}) {
    final dataStr = data != null ? ' | Data: $data' : '';
    _logger.i('Form Submission: $formName$dataStr');
  }

  /// Log form field interactions
  ///
  /// Example: logFormFieldInteraction('name', 'focused')
  void logFormFieldInteraction(String fieldName, String action) {
    _logger.d('Form Field: $fieldName - $action');
  }

  /// Log errors with optional stack trace
  ///
  /// Example: logError('Failed to load data', error, stackTrace)
  void logError(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Log warnings
  ///
  /// Example: logWarning('Form validation failed')
  void logWarning(String message, {Map<String, dynamic>? context}) {
    final contextStr = context != null ? ' | Context: $context' : '';
    _logger.w('$message$contextStr');
  }

  /// Log debug information
  ///
  /// Example: logDebug('Debug info', {'key': 'value'})
  void logDebug(String message, {Map<String, dynamic>? data}) {
    final dataStr = data != null ? ' | Data: $data' : '';
    _logger.d('$message$dataStr');
  }

  /// Log info messages
  ///
  /// Example: logInfo('App started')
  void logInfo(String message) {
    _logger.i(message);
  }
}
