/// Model representing a professional experience or timeline entry
class ExperienceModel {
  final String company;
  final String role;
  final String duration;
  final String period; // e.g., "2021", "2018-2021"
  final String description;
  final List<String> achievements;
  final List<String> techStack;
  final bool isCurrent;

  const ExperienceModel({
    required this.company,
    required this.role,
    required this.duration,
    required this.period,
    required this.description,
    required this.achievements,
    required this.techStack,
    this.isCurrent = false,
  });

  /// Sample experience data for the portfolio
  static const List<ExperienceModel> sampleExperiences = [
    ExperienceModel(
      company: 'ESDS Software Solution Pvt. Ltd.',
      role: 'iOS / Flutter Application Developer',
      duration: 'Feb 2021 – April 2022',
      period: '2021',
      description:
          'iOS & Flutter Application Developer working collaboratively with backend and Android teams. Responsible for developing requirements and deploying feature-rich applications to both the App Store and Play Store.',
      achievements: [
        'Collaborated with cross-functional teams (Backend, Android) to define requirements and integrate RESTful APIs.',
        'Successfully deployed and managed applications on both Apple App Store and Google Play Store.',
        'Architected and delivered scalable Flutter solutions ensuring seamless cross-platform performance.',
        'Enhanced app performance and user experience through rigorous debugging and optimization.',
        'Participated in client meetings to translate business needs into technical specifications.',
      ],
      techStack: ['Flutter', 'iOS', 'Dart', 'REST API', 'App Store Connect'],
      isCurrent: true,
    ),
    ExperienceModel(
      company: 'Solace Infotech, Nashik',
      role: 'iOS Application Developer',
      duration: 'Oct 2019 – Jan 2021',
      period: '2019',
      description:
          'iOS App Development with Swift 4.2. Experienced in working with Java, HTML, WordPress, & PHP including SQL Database and Firebase Database System.',
      achievements: [
        'Developed native iOS applications using Swift 4.2, focusing on clean architecture and maintainability.',
        'Integrated Firebase for real-time data handling, authentication, and cloud functions.',
        'Worked with SQL databases for efficient local data storage and synchronization.',
        'Collaborated on web-related technologies including PHP and WordPress integration for hybrid requirements.',
        'Maintained legacy codebases and implemented new features in an agile environment.',
      ],
      techStack: ['Swift 4.2', 'Firebase', 'SQL', 'PHP', 'Java'],
      isCurrent: false,
    ),
    ExperienceModel(
      company: 'WOWinfotech Nashik',
      role: 'iOS Application Developer',
      duration: 'July 2018 – Mar 2019',
      period: '2018',
      description:
          'iOS App Development with Swift 4.0, debugging with Objective-C. Experienced in working with Java, HTML, WordPress, & PHP including SQL Database and Firebase.',
      achievements: [
        'Built and maintained iOS applications using Swift 4.0 and Objective-C.',
        'Implemented robust database solutions using SQL and Firebase for data-driven applications.',
        'Debugged and optimized Objective-C legacy code to improve application stability.',
        'Collaborated with web developers to ensure seamless API integration with PHP/WordPress backends.',
        'Delivered projects within strict timelines while maintaining code quality standards.',
      ],
      techStack: ['Swift 4.0', 'Objective-C', 'Firebase', 'SQL', 'HTML'],
      isCurrent: false,
    ),
  ];
}
