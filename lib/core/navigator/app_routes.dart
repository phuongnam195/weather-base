import 'package:flutter/material.dart';
import 'package:weather_base/features/weather/presentation/screens/weather_screen.dart';

class AppRoutes {
  static String get initial => WeatherScreen.router;

  static Widget _buildScreen(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case WeatherScreen.router:
    }
    return const SizedBox.shrink();
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => _buildScreen(settings, context),
      settings: settings,
    );
  }
}
