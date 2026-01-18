import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/services/logger_service.dart';
import 'core/services/analytics_service.dart';
import 'features/home/presentation/home_screen.dart';

void main() {
  // Initialize services
  LoggerService.initialize();
  AnalyticsService.initialize();

  final logger = LoggerService();
  logger.logInfo('Portfolio application started');

  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vishal Shelake - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
