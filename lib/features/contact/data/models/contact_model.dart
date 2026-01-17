import 'package:flutter/material.dart';

/// Model for social connection information
class SocialConnection {
  final String platform;
  final String handle;
  final String stats;
  final IconData icon;
  final String url;

  const SocialConnection({
    required this.platform,
    required this.handle,
    required this.stats,
    required this.icon,
    required this.url,
  });

  // Sample data
  static List<SocialConnection> getSocialConnections() {
    return [
      SocialConnection(
        platform: 'LinkedIn',
        handle: '@vishal.shelake',
        stats: '5k+ Connections',
        icon: Icons.person,
        url: 'https://linkedin.com/in/vishal-shelake',
      ),
      SocialConnection(
        platform: 'GitHub',
        handle: '@vishalshelake',
        stats: '43+ Repos',
        icon: Icons.code,
        url: 'https://github.com/vishalshelake',
      ),
      SocialConnection(
        platform: 'Twitter',
        handle: '@vishal_codes',
        stats: '2.3k Followers',
        icon: Icons.share,
        url: 'https://twitter.com/vishalshelake',
      ),
    ];
  }
}

/// Model for location information
class LocationInfo {
  final String city;
  final String timezone;
  final String currentTime;

  const LocationInfo({
    required this.city,
    required this.timezone,
    required this.currentTime,
  });

  static LocationInfo getCurrentLocation() {
    // In a real app, this would be dynamic based on actual timezone
    return const LocationInfo(
      city: 'San Francisco',
      timezone: 'PST (UTC-8)',
      currentTime: '10:42 AM',
    );
  }
}
