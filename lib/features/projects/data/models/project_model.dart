/// Model representing a project with comprehensive information
class ProjectModel {
  final String id;
  final String title;
  final String shortDescription;
  final String fullDescription;
  final List<String> categories; // e.g., ['Flutter', 'iOS', 'Web']
  final String mainCategory; // Primary category for filtering
  final List<String> techStack;
  final Map<String, List<String>> organizedTechStack; // Organized by category
  final String? heroImage;
  final List<String> screenshots;
  final String? challenge;
  final List<String> features;
  final List<ProjectMetric> metrics;
  final String? codeSnippet;
  final String? codeLanguage;
  final String? githubUrl;
  final String? demoUrl;
  final String? appStoreUrl;
  final bool isFeatured;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.fullDescription,
    required this.categories,
    required this.mainCategory,
    required this.techStack,
    this.organizedTechStack = const {},
    this.heroImage,
    this.screenshots = const [],
    this.challenge,
    this.features = const [],
    this.metrics = const [],
    this.codeSnippet,
    this.codeLanguage,
    this.githubUrl,
    this.demoUrl,
    this.appStoreUrl,
    this.isFeatured = false,
  });

  /// Sample projects data
  static final List<ProjectModel> sampleProjects = [
    // MoFpi (Ministry of Food Processing Industries)
    ProjectModel(
      id: 'mofpi',
      title: 'MoFpi',
      shortDescription:
          'Ministry of Food Processing Industries app for video conferencing and communication.',
      fullDescription:
          'MoFpi (Ministry of Food Processing Industries) is a scalable, secure, and completely encrypted video conferencing system that enables for non-disruptive voice and video conversations. MoFpi is simple to use and may be used for daily communication between coworkers, classrooms, and other locations where genuine dialogue occurs between people who are physically separated.',
      categories: ['Flutter', 'Government', 'Communication'],
      mainCategory: 'Flutter',
      techStack: [
        'Flutter 2.8',
        'API Integration',
        'Secure Video',
        'Session Management'
      ],
      heroImage: 'assets/images/screenshots/Mofpi/mofpiLogo.png',
      screenshots: [
        'assets/images/screenshots/Mofpi/1_iphone12black_portrait.png',
        'assets/images/screenshots/Mofpi/2_iphone12black_portrait.png',
        'assets/images/screenshots/Mofpi/3_iphone12black_portrait.png',
        'assets/images/screenshots/Mofpi/4_iphone12black_portrait.png',
        'assets/images/screenshots/Mofpi/5_iphone12black_portrait.png',
        'assets/images/screenshots/Mofpi/6_iphone12black_portrait.png',
      ],
      organizedTechStack: {
        'Frontend': ['Flutter 2.8', 'Android Studio'],
        'Tools': ['VSCode', 'Github'],
      },
      features: [
        'Secure video conferencing',
        'Complex UI Designing',
        'API Integration',
        'Login Session Management',
        'Complex UI with Data Parsing',
      ],
      appStoreUrl: 'https://www.mofpi.gov.in/',
      isFeatured: true,
    ),

    // iPAS
    ProjectModel(
      id: 'ipas',
      title: 'iPAS',
      shortDescription:
          'District Planning Committee application for work inspections and expenditure tracking with Geo-Tagging.',
      fullDescription:
          'This Application is for the District Planning committee\'s (DPC) users like District Collectors, District Planning Officers, and All Implementation agency users. Using this Application Implementation users can submit work inspections, Expenditure details for works that are assigned to them by the District Planning Committee. The District Planning Committee User can Supervision the work Inspection submitted by Implementation Agency. This Application Uses Geo-Tagging on Images captured by this application.',
      categories: ['iOS', 'Government', 'Enterprise'],
      mainCategory: 'iOS',
      techStack: ['Swift 5', 'Core Data', 'Geo-Tagging', 'REST API'],
      heroImage: 'assets/images/screenshots/iPAS/iPASLogo.png',
      screenshots: [
        'assets/images/screenshots/iPAS/iPass1_iphone12black_portrait.png',
        'assets/images/screenshots/iPAS/iPass2_iphone12black_portrait.png',
        'assets/images/screenshots/iPAS/iPass3_iphone12black_portrait.png',
        'assets/images/screenshots/iPAS/iPass4_iphone12black_portrait.png',
        'assets/images/screenshots/iPAS/iPass5_iphone12black_portrait.png',
        'assets/images/screenshots/iPAS/iPass6_iphone12black_portrait.png',
        'assets/images/screenshots/iPAS/iPass7_iphone12black_portrait.png',
        'assets/images/screenshots/iPAS/iPass8_iphone12black_portrait.png',
        'assets/images/screenshots/iPAS/iPass9_iphone12black_portrait.png',
        'assets/images/screenshots/iPAS/iPass10_iphone12black_portrait.png',
      ],
      organizedTechStack: {
        'Frontend': ['Swift 5', 'UIKit'],
        'Data': ['Core Data', 'JSON Parsing'],
        'Features': ['Geo-Tagging', 'Camera Integration'],
        'Pattern': ['MVVM Architecture'],
      },
      features: [
        'Work inspection submission',
        'Expenditure tracking',
        'Geo-tagging for images',
        'Role-based access (Collector, DPC, Agency)',
        'Complex UI with Data Parsing',
      ],
      appStoreUrl:
          'https://spochub.com/product/ipas---integrated-planning-office-automation-system/30',
      isFeatured: true,
    ),

    // Live Queen Of Hearts
    ProjectModel(
      id: 'live-queen-of-hearts',
      title: 'Live Queen Of Hearts',
      shortDescription:
          'Live Sweepstakes drawing game where users uncover cards to win jackpots.',
      fullDescription:
          'Users can watch and play in a live Queen of Hearts game show using the Queen of Hearts mobile application. On Sundays and Wednesdays, the show would air at 7.30 p.m. and 9.00 p.m. (GMT-7) in the United States. Sweepstakes drawing in real time! On the board, 55 cards were put at random. One token will be drawn for each drawing in the hopes of uncovering a card. Find the Queen of Hearts and you\'ll be the big winner! Each week that the Queen of Hearts isn\'t revealed, the jackpot grows! WIN a PRIZE if you find a Joker, other queens, or a BONUS card! Licensed and Bonded.',
      categories: ['iOS', 'Game', 'Entertainment'],
      mainCategory: 'iOS',
      techStack: ['Swift 5', 'Animation', 'REST API', 'Socket.IO'],
      heroImage: 'assets/images/screenshots/QOH/QOHappLogo.png',
      screenshots: [
        'assets/images/screenshots/QOH/Qoh1.png',
        'assets/images/screenshots/QOH/Qoh2.png',
        'assets/images/screenshots/QOH/Qoh3.png',
        'assets/images/screenshots/QOH/Qoh4.png',
        'assets/images/screenshots/QOH/Qoh5.png',
        'assets/images/screenshots/QOH/Qoh6.png',
        'assets/images/screenshots/QOH/Qoh7.png',
        'assets/images/screenshots/QOH/Qoh8.png',
      ],
      features: [
        'Live sweepstakes drawing logic',
        'Real-time card uncovering animations',
        'Jackpot tracking',
        'Prize system integration',
        'Socket.IO for real-time updates',
      ],
      appStoreUrl:
          'https://apps.apple.com/us/app/live-queen-of-hearts/id1465569268',
      isFeatured: true,
    ),

    // eNlight Meet
    ProjectModel(
      id: 'enlight-meet',
      title: 'eNlight Meet',
      shortDescription:
          'Scalable, secure, and fully encrypted video conferencing solution.',
      fullDescription:
          'eNlight Meet is a scalable, secure, and completely encrypted video conferencing system that enables for non-disruptive voice and video conversations. eNlight Meet is simple to use and may be used for daily communication between coworkers, classrooms, and other locations where genuine dialogue occurs between people who are physically separated.',
      categories: ['iOS', 'Communication', 'Video'],
      mainCategory: 'iOS',
      techStack: ['Swift 5', 'WebRTC', 'Encryption', 'Jitsi Framework'],
      heroImage: 'assets/images/screenshots/eNlightMeet/enlightLogo.png',
      screenshots: [
        'assets/images/screenshots/eNlightMeet/enlightmeet1_iphone12black_portrait.png',
        'assets/images/screenshots/eNlightMeet/enlightMeet_iphone12black_portrait.png',
        'assets/images/screenshots/eNlightMeet/eNlightmeet2_iphone12black_portrait.png',
      ],
      organizedTechStack: {
        'Communication': ['WebRTC', 'Audio/Video'],
        'Security': ['End-to-End Encryption', 'AES 256 CBC'],
        'Framework': ['Custom Framework over Unix', 'Jitsi'],
        'Architecture': ['MVVM'],
      },
      features: [
        'Secure video conferencing with End-to-End Encryption',
        'HD audio and video',
        'Content sharing and Virtual backgrounds',
        'Raise hand, reactions, and Polls',
        'Chat with private conversations',
      ],
      appStoreUrl: 'https://spochub.com/product/enlight-meet/68',
      isFeatured: true,
    ),

    // Union Bank Healthcare
    ProjectModel(
      id: 'union-bank-healthcare',
      title: 'Union Bank Healthcare',
      shortDescription:
          'Healthcare app for insurance claim settlements and hospital network location.',
      fullDescription:
          'The purpose of the Union Bank Healthcare App is to make it easier for users to settle medical insurance claims by providing vital features such as claim intimation, cashless procedure with sophisticated table organised sheets, and identifying network hospitals on a Google map. With multiple document upload and live scanning of ID cards, you may easily edit the detected rectangle.',
      categories: ['iOS', 'Fintech', 'Healthcare'],
      mainCategory: 'iOS',
      techStack: [
        'Swift 5',
        'Vision Framework',
        'Google Maps',
        'Multipart Upload',
        'MVVM'
      ],
      heroImage: 'assets/images/screenshots/UnionBankHealthcare/UBIH2.png',
      screenshots: [
        'assets/images/screenshots/UnionBankHealthcare/UBIH3.png',
        'assets/images/screenshots/UnionBankHealthcare/UBIH4.png',
        'assets/images/screenshots/UnionBankHealthcare/UBIH5.png',
        'assets/images/screenshots/UnionBankHealthcare/UBIH6.png',
      ],
      organizedTechStack: {
        'Features': ['Claim Intimation', 'Cashless Procedure'],
        'Tech': ['Vision (ID Scanning)', 'Google Maps API'],
        'Security': ['AES 256 CBC Encryption Algorithm'],
        'Architecture': ['MVVM'],
      },
      features: [
        'Medical insurance claim settlement',
        'Network hospital finder with Maps',
        'Live ID card scanning and editing',
        'Multiple document uploads',
        'Complex table structured sheets',
      ],
      appStoreUrl:
          'https://www.unionbankofindia.co.in/english/digi-app-banking.aspx',
    ),

    // SYPrints
    ProjectModel(
      id: 'syprints',
      title: 'SYPrints',
      shortDescription:
          'Online Printing Solution app for Admin, Staff, and Customers with real-time chat.',
      fullDescription:
          'Online Printing Solution app for Admin, Staff, and Customers where Customers can monitor their print printing progress and instruct the staff in real time with media chat utilising Firebase Firestore for realtime conversation and AWS S3 Database for storing media.',
      categories: ['iOS', 'E-commerce', 'Utility'],
      mainCategory: 'iOS',
      techStack: ['Swift 5', 'Firebase Firestore', 'AWS S3', 'Chat UI'],
      heroImage: 'assets/images/screenshots/SYPrints/SyPrintLogo.png',
      screenshots: [
        'assets/images/screenshots/SYPrints/SyPrints1.png',
        'assets/images/screenshots/SYPrints/SyPrints2.png',
        'assets/images/screenshots/SYPrints/SyPrints3.png',
        'assets/images/screenshots/SYPrints/SyPrints4.png',
        'assets/images/screenshots/SYPrints/SyPrints5.png',
        'assets/images/screenshots/SYPrints/SyPrints6.png',
        'assets/images/screenshots/SYPrints/SyPrints7.png',
      ],
      organizedTechStack: {
        'Backend': ['Firebase Firestore', 'AWS S3'],
        'Frontend': ['Swift 5', 'Media Chat'],
        'Architecture': ['MVVM'],
      },
      features: [
        'Real-time order status tracking',
        'In-app chat with media support',
        'Admin and Staff coordination',
        'Cloud storage for print files',
      ],
      appStoreUrl: 'http://syprinting.com.my/home/home',
    ),

    // Lilacard
    ProjectModel(
      id: 'lilacard',
      title: 'Lilacard',
      shortDescription:
          'Benefits card app for Hanover connecting providers and consumers.',
      fullDescription:
          'lilacard is a Hanover-based network. The lilacard is a benefits card that connects providers and customers. We create an unmatched win-win situation by assisting lilacard partners in the Hanover region in getting new clients and improving sales. Lilacard holders may participate in a variety of leisure activities and enjoy Hanover\'s entertainment scene at half the price.',
      categories: ['iOS', 'Lifestyle', 'Deals'],
      mainCategory: 'iOS',
      techStack: ['Swift 5', 'Location Services', 'REST API', 'MapKit'],
      heroImage: 'assets/images/screenshots/Lilacard/LilacardLogo.png',
      screenshots: [
        'assets/images/screenshots/Lilacard/LilacardScreen1_iphone12black_portrait.png',
        'assets/images/screenshots/Lilacard/LilacardScreen2_iphone12black_portrait.png',
        'assets/images/screenshots/Lilacard/LilacardScreen3_iphone12black_portrait.png',
        'assets/images/screenshots/Lilacard/LilacardScreen4_iphone12black_portrait.png',
        'assets/images/screenshots/Lilacard/LilacardScreen5_iphone12black_portrait.png',
        'assets/images/screenshots/Lilacard/LilacardScreen6_iphone12black_portrait.png',
        'assets/images/screenshots/Lilacard/LilacardScreen7_iphone12black_portrait.png',
        'assets/images/screenshots/Lilacard/LilacardScreen8_iphone12black_portrait.png',
        'assets/images/screenshots/Lilacard/LilacardScreen9_iphone12black_portrait.png',
        'assets/images/screenshots/Lilacard/LilacardScreen10_iphone12black_portrait.png',
      ],
      features: [
        'Digital benefits card',
        'Partner discovery and deals',
        'Leisure activity listing',
        'Discount redemption',
        'MapKit integration for location',
        'QR Code Scanner',
      ],
      appStoreUrl: 'https://www.lilacard.de/',
    ),

    // Escape City - The City Of Mystery
    ProjectModel(
      id: 'escape-city',
      title: 'Escape City',
      shortDescription:
          'iPad treasure hunt game with location-based challenges.',
      fullDescription:
          'Escape City was created exclusively for the iPad and is similar to a treasure hunt game, with the team having the desired site to visit and the user having to answer certain questions in order to visit the next area, with the person who completes all of the locations being proclaimed the winner.',
      categories: ['iOS', 'iPad', 'Game'],
      mainCategory: 'iOS',
      techStack: ['Swift 4', 'Core Location', 'iPadOS'],
      heroImage: 'assets/images/screenshots/EscapeCity/EscapeCityLogo.png',
      screenshots: [
        'assets/images/screenshots/EscapeCity/EscapeC1_ipad_spacegrey_landscape.png',
        'assets/images/screenshots/EscapeCity/EscapeC2_ipad_spacegrey_landscape.png',
        'assets/images/screenshots/EscapeCity/EscapeC3_ipad_spacegrey_landscape.png',
        'assets/images/screenshots/EscapeCity/EscapeC4_ipad_spacegrey_landscape.png',
        'assets/images/screenshots/EscapeCity/EscapeC5_ipad_spacegrey_landscape.png',
        'assets/images/screenshots/EscapeCity/EscapeC6_ipad_spacegrey_landscape.png',
        'assets/images/screenshots/EscapeCity/EscapeC7_ipad_spacegrey_landscape.png',
      ],
      features: [
        'Location-based treasure hunt',
        'iPad optimized UI',
        'Question and challenge system',
        'Team winner declaration',
      ],
    ),

    // Art To Frame
    ProjectModel(
      id: 'art-to-frame',
      title: 'Art To Frame',
      shortDescription:
          'E-commerce app for custom framing, canvas wraps, and acrylic prints.',
      fullDescription:
          'Custom framing, collage frames, canvas wraps, and acrylic prints have all been available at reasonable costs with ArtToFrames. ArtToFrames is the place to go for all your fine art wall-decor requirements, with over 250 frame options, many mat colours, and the finest glass on the market.',
      categories: ['iOS', 'E-commerce', 'Retail'],
      mainCategory: 'iOS',
      techStack: ['Swift 4', 'Payment Gateway', 'REST API', 'SDWebImage'],
      heroImage: 'assets/images/screenshots/ArtToFrame/ATFLogo.png',
      screenshots: [
        'assets/images/screenshots/ArtToFrame/IMG_0017_iphone12miniblack_portrait.png',
        'assets/images/screenshots/ArtToFrame/IMG_0018_iphone12miniblack_portrait.png',
        'assets/images/screenshots/ArtToFrame/IMG_0019_iphone12miniblack_portrait.png',
        'assets/images/screenshots/ArtToFrame/IMG_0020_iphone12miniblack_portrait.png',
        'assets/images/screenshots/ArtToFrame/IMG_0021_iphone12miniblack_portrait.png',
      ],
      features: [
        'Custom frame visualization',
        'Product catalog (250+ choices)',
        'Shopping cart and checkout',
        'Order customization',
      ],
      appStoreUrl:
          'https://apps.apple.com/in/app/arttoframe-custom-framing/id1313660238',
    ),

    // iREVO: Aldo
    ProjectModel(
      id: 'irevo-aldo',
      title: 'Aldo (iREVO)',
      shortDescription:
          'Video conferencing and messaging app with whiteboard sharing.',
      fullDescription:
          'Aldo is a video conferencing and messaging product by irevomm that includes features such as creating and joining meetings, whiteboard sharing, and up to 16 participants in a single conference. It also supports cross-platform devices.',
      categories: ['iOS', 'Communication', 'Collab'],
      mainCategory: 'iOS',
      techStack: ['Swift 5', 'Video Conferencing SDK', 'Whiteboard'],
      heroImage: 'assets/images/screenshots/Aldo/irevo_ft_logo.png',
      screenshots: [
        'assets/images/screenshots/Aldo/Aldo1_iphone12black_portrait.png',
        'assets/images/screenshots/Aldo/Aldo2_iphone12black_portrait.png',
        'assets/images/screenshots/Aldo/Aldo3_iphone12black_portrait.png',
      ],
      features: [
        'Video conferencing (16 users)',
        'Whiteboard sharing',
        'Cross-platform support',
        'Instant messaging',
      ],
      appStoreUrl: 'https://apps.apple.com/vc/app/aldo-vcall/id1536262100',
    ),

    // PUS (Patent Services USA)
    ProjectModel(
      id: 'pus-patent',
      title: 'Patent Services USA',
      shortDescription:
          'App for patenting ideas, product innovations, and tracking registration.',
      fullDescription:
          'Users who wish to patent their ideas, product innovations, or app concepts may do so by creating an account, uploading photos, and using a payment method, as well as keeping track of all registered innovations.',
      categories: ['iOS', 'Legal', 'Utility'],
      mainCategory: 'iOS',
      techStack: ['Swift 4', 'Payment Gateway', 'Image Upload'],
      heroImage:
          'assets/images/screenshots/PUS/PUS1_iphone12black_portrait.png',
      screenshots: [
        'assets/images/screenshots/PUS/PUS2_iphone12black_portrait.png',
        'assets/images/screenshots/PUS/PUS3_iphone12black_portrait.png',
        'assets/images/screenshots/PUS/PUS4_iphone12black_portrait.png',
      ],
      features: [
        'User registration and account management',
        'Innovation/Idea submission',
        'Image upload',
        'Payment gateway integration',
        'Application tracking',
      ],
      appStoreUrl:
          'https://apps.apple.com/in/app/patent-services-usa/id1509774213',
    ),

    // Wizing Bank
    ProjectModel(
      id: 'wizing-bank',
      title: 'Wizing Bank',
      shortDescription:
          'Bilingual banking application enabling secure financial transactions.',
      fullDescription:
          'Wizing Bank is a comprehensive banking solution developed in Spanish and English. Built with SwiftUI and following Clean MVVM architecture, it ensures a robust and scalable codebase. The project encompasses a proprietary component library and a dedicated environment for unit testing. It integrates standard REST APIs and follows strict Bitbucket development processes for version control and code quality.',
      categories: ['iOS', 'Fintech', 'Banking'],
      mainCategory: 'iOS',
      techStack: [
        'SwiftUI',
        'Clean MVVM',
        'REST API',
        'Unit Testing',
        'Component Library'
      ],
      heroImage: 'assets/images/screenshots/WiZinkBank/Logo-Wizink.webp',
      screenshots: [
        'assets/images/screenshots/WiZinkBank/wz1.png',
        'assets/images/screenshots/WiZinkBank/wz2.png',
        'assets/images/screenshots/WiZinkBank/wz4.png',
      ],
      organizedTechStack: {
        'Architecture': ['Clean MVVM', 'Component Library'],
        'Process': ['Bitbucket', 'Unit Testing'],
        'Integration': ['REST API'],
      },
      features: [
        'Bilingual support (English/Spanish)',
        'Secure banking transactions',
        'Modular component library',
        'Comprehensive unit test coverage',
      ],
      appStoreUrl:
          'https://apps.apple.com/es/app/wizink-bank-tu-banco-online/id1120078772',
      isFeatured: true,
    ),

    // Barrb Tocasalir
    ProjectModel(
      id: 'barrb-tocasalir',
      title: 'QDAMOS (Barrb Tocasalir)',
      shortDescription:
          'Liquor redemption platform with shop locator and QR scanning.',
      fullDescription:
          'Barrb Tocasalir is a liquor redemption application where users can earn and redeem points on drinks under the BAHU brand program. Developed using UIKit and Clean MVVM architecture, it features Google Maps integration for locating shops and Google OCR for scanning QR codes and barcodes for seamless coupon redemption.',
      categories: ['iOS', 'Lifestyle', 'Loyalty'],
      mainCategory: 'iOS',
      techStack: [
        'UIKit',
        'Google Maps',
        'Google OCR',
        'Clean MVVM',
        'Unit Testing'
      ],
      heroImage: 'assets/images/screenshots/BarrbMahu/Logo-barrb.webp',
      screenshots: [
        'assets/images/screenshots/BarrbMahu/barrb1.webp',
        'assets/images/screenshots/BarrbMahu/barrb2.webp',
        'assets/images/screenshots/BarrbMahu/barrb4.webp',
      ],
      organizedTechStack: {
        'Architecture': ['Clean MVVM'],
        'Location': ['Google Maps'],
        'Scanning': ['Google OCR (QR/Barcode)'],
      },
      features: [
        'Shop locator with Google Maps',
        'QR and Barcode scanning for redemption',
        'Loyalty point system',
        'Clean MVVM Architecture',
      ],
      appStoreUrl: 'https://apps.apple.com/es/app/qdamos/id1599741387',
      isFeatured: false,
    ),

    // PhactMI
    ProjectModel(
      id: 'phactmi',
      title: 'PhactMI',
      shortDescription:
          'Medical research documentation and drug information library.',
      fullDescription:
          'PhactMI is a non-profit organization application that serves as a library for medical firms. It facilitates the maintenance of research papers and documentation related to medical drugs, aiding in the development process. The app is built with Clean Architecture, includes unit tests, and is deployed on both iOS and Android platforms.',
      categories: ['iOS', 'Medical', 'Non-profit'],
      mainCategory: 'iOS',
      techStack: [
        'Swift',
        'Clean Architecture',
        'Unit Testing',
        'Cross-platform Deployment'
      ],
      heroImage: 'assets/images/screenshots/PhactMI/Logo-Phactmi.webp',
      screenshots: [
        'assets/images/screenshots/PhactMI/Phactmi2.webp',
        'assets/images/screenshots/PhactMI/Phactmi3.webp',
      ],
      organizedTechStack: {
        'Architecture': ['Clean Architecture'],
        'Domain': ['Medical Research', 'Documentation'],
      },
      features: [
        'Medical research paper repository',
        'Drug development support',
        'Clean Architecture implementation',
        'Available on App Store',
      ],
      appStoreUrl: 'https://apps.apple.com/us/app/phactmi/id6468638050',
      isFeatured: false,
    ),

    // Royal Caribbean
    ProjectModel(
      id: 'royal-caribbean',
      title: 'Royal Caribbean',
      shortDescription:
          'Global cruise line application with GraphQL integration.',
      fullDescription:
          'A global application for Royal Caribbean developed in SwiftUI using Clean MVVM architecture. The project emphasizes code reusability through a custom component package and maintains high code quality with standard PR processes. It leverages GraphQL for efficient data fetching and backend integration.',
      categories: ['iOS', 'Travel', 'Enterprise'],
      mainCategory: 'iOS',
      techStack: [
        'SwiftUI',
        'GraphQL',
        'Clean MVVM',
        'Component Package',
        'Unit Testing'
      ],
      heroImage: 'assets/images/screenshots/RoyalCarribian/Logo-Royal.webp',
      screenshots: [
        'assets/images/screenshots/RoyalCarribian/RC1.webp',
        'assets/images/screenshots/RoyalCarribian/RC2.webp',
        'assets/images/screenshots/RoyalCarribian/RC3.webp',
        'assets/images/screenshots/RoyalCarribian/RC4.webp',
        'assets/images/screenshots/RoyalCarribian/RC5.webp',
        'assets/images/screenshots/RoyalCarribian/RC6.webp',
      ],
      organizedTechStack: {
        'UI': ['SwiftUI', 'Component Package'],
        'Backend': ['GraphQL'],
        'Architecture': ['Clean MVVM'],
      },
      features: [
        'Global cruise management',
        'GraphQL data integration',
        'Reusable component ecosystem',
        'Strict code quality standards',
      ],
      appStoreUrl:
          'https://apps.apple.com/us/app/royal-caribbean-international/id1260728016',
      isFeatured: true,
    ),

    // LA Clippers Intuit Dome
    ProjectModel(
      id: 'la-clippers-intuit',
      title: 'LA Clippers Intuit Dome',
      shortDescription:
          'Staff application for stadium management and user monitoring.',
      fullDescription:
          'This specialized application for Intuit Dome staff supports iPad and large-screen iPhones. Developed in SwiftUI with Clean MVVM, it features advanced capabilities like NFC compatibility for band scanning, camera integration for user activity monitoring and face recognition, and inventory management. The app also includes robust accessibility support and localization.',
      categories: ['iOS', 'Sports', 'Enterprise', 'iPad'],
      mainCategory: 'iOS',
      techStack: [
        'SwiftUI',
        'NFC',
        'Camera/Face Recognition',
        'Accessibility',
        'Clean MVVM'
      ],
      heroImage: 'assets/images/screenshots/LAClippers/Logo-LAClippers.webp',
      screenshots: [
        'assets/images/screenshots/LAClippers/LA1.webp',
        'assets/images/screenshots/LAClippers/LA2.webp',
        'assets/images/screenshots/LAClippers/LA4.webp',
      ],
      organizedTechStack: {
        'Hardware': ['NFC', 'Camera', 'Face Recognition'],
        'UI/UX': ['SwiftUI', 'Accessibility', 'Localization'],
        'Debugging': ['LLDB'],
      },
      features: [
        'Staff management portal',
        'NFC band scanning',
        'Real-time user activity monitoring',
        'Inventory system',
        'Accessibility and Localization',
      ],
      appStoreUrl:
          'https://apps.apple.com/us/app/la-clippers-intuit-dome/id6476565235',
      isFeatured: true,
    ),

    // VOX Cinemas
    ProjectModel(
      id: 'vox-cinemas',
      title: 'VOX Cinemas',
      shortDescription:
          'Native mobile app for booking movies, events, and sports across the MENA region.',
      fullDescription:
          'A comprehensive mobile application for Vox Cinemas allowing users to browse movies, book tickets, manage their accounts, and access exclusive offers. The app features a modern, responsive UI, secure authentication through Auth0, and real-time data synchronization. It leverages a BFF (Backend-for-Frontend) architecture to orchestrate microservices for Content, Booking, and Payments (Checkout.com), ensuring a seamless omnichannel experience. Features include seat selection, F&B ordering, and loyalty integration (SHARE & VOX Rewards).',
      categories: ['Flutter', 'Entertainment', 'E-commerce'],
      mainCategory: 'Flutter',
      techStack: [
        'Flutter',
        'Provider',
        'GoRouter',
        'BFF Architecture',
        'Auth0',
        'Firebase',
        'Meilisearch',
        'Analytics',
        'CMS',
        'CRM'
      ],
      heroImage: 'assets/images/screenshots/VoxCinema/Logo-VOX.webp',
      screenshots: [
        'assets/images/screenshots/VoxCinema/Vox2.png',
        'assets/images/screenshots/VoxCinema/Vox3.png',
        'assets/images/screenshots/VoxCinema/Vox4.png',
      ],
      organizedTechStack: {
        'Frontend': ['Flutter', 'Provider', 'GoRouter', 'Dio'],
        'Backend': ['BFF', 'Microservices', 'Auth0', 'Meilisearch'],
        'Integrations': ['VISTA (Cinema)', 'Checkout.com', 'Braze', 'Adjust'],
        'Platform': ['Analytics', 'CMS', 'CRM'],
      },
      features: [
        'End-to-end Movie & Event Booking',
        'Seat Selection & F&B Ordering',
        'Loyalty Integration (SHARE, VOX Rewards)',
        'Secure Payments & Digital Wallet',
        'Real-time Personalization & Offers',
      ],
      appStoreUrl: 'https://apps.apple.com/ae/app/vox-cinemas-app/id669495038',
      isFeatured: true,
    ),
  ];
}

/// Model for project metrics/results
class ProjectMetric {
  final String value;
  final String label;
  final String? description;

  const ProjectMetric({
    required this.value,
    required this.label,
    this.description,
  });
}
