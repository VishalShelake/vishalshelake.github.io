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
        handle: 'vishalshelake',
        stats: '5k+ Connections',
        icon: Icons.person,
        url: 'https://www.linkedin.com/in/vishalshelake',
      ),
      SocialConnection(
        platform: 'GitHub',
        handle: 'vishalshelake',
        stats: '43+ Repos',
        icon: Icons.code,
        url: 'https://github.com/vishalshelake',
      ),
      SocialConnection(
        platform: 'Twitter',
        handle: 'vishalshelake',
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

  const LocationInfo({
    required this.city,
    required this.timezone,
  });

  static LocationInfo getCurrentLocation() {
    return const LocationInfo(
      city: 'Nashik, Maharashtra',
      timezone: 'IST (UTC+5:30)',
    );
  }
}
