import 'dart:js_interop';

/// Google Analytics 4 service for tracking user interactions
///
/// Uses gtag.js for web analytics. Events are tracked via JavaScript interop.
///
/// Usage:
/// ```dart
/// final analytics = AnalyticsService();
/// analytics.logScreenView('Home');
/// analytics.logEvent('button_click', params: {'button_name': 'submit'});
/// ```
class AnalyticsService {
  static final AnalyticsService _instance = AnalyticsService._internal();

  /// Enable console logging in debug mode
  static const bool _debugMode = true;

  factory AnalyticsService() {
    return _instance;
  }

  AnalyticsService._internal();

  /// Initialize the analytics service
  /// Call this in main() before running the app
  static void initialize() {
    if (_debugMode) {
      _log('Analytics initialized');
    }
  }

  // ============ Screen Tracking ============

  /// Log screen view events
  void logScreenView(String screenName, {Map<String, dynamic>? params}) {
    final eventParams = {
      'page_title': screenName,
      'page_location': screenName,
      ...?params,
    };
    _sendEvent('page_view', eventParams);
  }

  // ============ Navigation Tracking ============

  /// Log navigation events between screens
  void logNavigation(String from, String to, {bool isBack = false}) {
    _sendEvent('navigation', {
      'from_screen': from,
      'to_screen': to,
      'direction': isBack ? 'back' : 'forward',
    });
  }

  // ============ User Interaction Tracking ============

  /// Log generic events
  void logEvent(String eventName, {Map<String, dynamic>? params}) {
    _sendEvent(eventName, params ?? {});
  }

  /// Log nav bar item clicks
  void logNavItemClick(String itemName, int index) {
    _sendEvent('nav_item_click', {
      'item_name': itemName,
      'item_index': index,
    });
  }

  /// Log project card clicks
  void logProjectClick(String projectId, String projectName) {
    _sendEvent('project_click', {
      'project_id': projectId,
      'project_name': projectName,
    });
  }

  /// Log featured project clicks
  void logFeaturedProjectClick(String projectName) {
    _sendEvent('featured_project_click', {
      'project_name': projectName,
    });
  }

  /// Log contact card clicks
  void logContactClick(String contactType) {
    _sendEvent('contact_click', {
      'contact_type': contactType,
    });
  }

  /// Log category/filter changes
  void logFilterChange(String filterType, String value) {
    _sendEvent('filter_change', {
      'filter_type': filterType,
      'filter_value': value,
    });
  }

  // ============ Form Tracking ============

  /// Log form submissions
  void logFormSubmission(String formName, {Map<String, dynamic>? data}) {
    final eventParams = {
      'form_name': formName,
      ...?data,
    };
    _sendEvent('form_submit', eventParams);
  }

  /// Log form field interactions
  void logFormFieldInteraction(String fieldName, String action) {
    _sendEvent('form_field_interaction', {
      'field_name': fieldName,
      'action': action,
    });
  }

  // ============ Outbound Link Tracking ============

  /// Log external link clicks
  void logOutboundLink(String url, String linkText) {
    _sendEvent('outbound_link', {
      'link_url': url,
      'link_text': linkText,
    });
  }

  // ============ Scroll Depth Tracking ============

  /// Log scroll depth milestones (25%, 50%, 75%, 100%)
  void logScrollDepth(String pageName, int percentScrolled) {
    _sendEvent('scroll', {
      'page_name': pageName,
      'percent_scrolled': percentScrolled,
    });
  }

  // ============ Time on Screen Tracking ============

  /// Log time spent on a screen when user navigates away
  void logScreenTime(String screenName, int durationSeconds) {
    _sendEvent('screen_time', {
      'screen_name': screenName,
      'duration_seconds': durationSeconds,
    });
  }

  // ============ Internal Methods ============

  /// Send event to Google Analytics via gtag.js
  void _sendEvent(String eventName, Map<String, dynamic> params) {
    if (_debugMode) {
      _log('Event: $eventName | Params: $params');
    }

    try {
      _gtag('event'.toJS, eventName.toJS, params.jsify());
    } catch (e) {
      if (_debugMode) {
        _log('Error sending event: $e');
      }
    }
  }

  static void _log(String message) {
    // ignore: avoid_print
    print('[Analytics] $message');
  }
}

/// JavaScript interop for gtag function
@JS('gtag')
external void _gtag(JSString command, JSString eventName, JSAny? params);
