/// Application-wide constants
class AppConstants {
  // Responsive breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;
  static const double wideBreakpoint = 1600;

  // Spacing scale
  static const double spacing4 = 4.0;
  static const double spacing6 = 6.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing48 = 48.0;
  static const double spacing64 = 64.0;
  static const double spacing96 = 96.0;

  // Border radius
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 24.0;

  // Animation durations (milliseconds)
  static const int animationFast = 200;
  static const int animationNormal = 300;
  static const int animationSlow = 500;

  // Blur values
  static const double blurLight = 8.0;
  static const double blurMedium = 16.0;
  static const double blurHeavy = 24.0;

  // Portfolio data
  static const String portfolioName = 'Vishal Shelake';
  static const String portfolioTitle = 'Senior Engineer';
  static const String portfolioBio =
      'I build pixel-perfect, buttery-smooth mobile experiences. '
      'Currently leading the mobile team at FinTech Corp.';
  static const int yearsOfExperience = 8;
  static const String experienceStartYear = '2016';

  // URLs
  static const String resumeUrl = 'https://example.com/resume.pdf';
  static const String linkedInUrl = 'https://linkedin.com/in/vishal-shelake';
  static const String githubUrl = 'https://github.com/vishalshelake';
  static const String twitterUrl = 'https://twitter.com/vishalshelake';
  static const String emailAddress = 'vishal.shelake@example.com';

  // Tech stack
  static const List<Map<String, String>> techStack = [
    {'name': 'CI/CD', 'description': 'Continuous Integration'},
    {'name': 'Firebase', 'description': 'Backend Services'},
    {'name': 'GraphQL', 'description': 'API Query Language'},
    {'name': 'Android', 'description': 'Mobile Development'},
  ];
}
