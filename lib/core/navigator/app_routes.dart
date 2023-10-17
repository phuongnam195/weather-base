import 'package:flutter/material.dart';
import 'package:weather_base/features/weather/presentation/screens/search_location_screen.dart';
import 'package:weather_base/features/weather/presentation/screens/weather_screen.dart';

class AppRoutes {
  AppRoutes._();

  static String get initial => WeatherScreen.router;

  static Widget _buildScreen(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case WeatherScreen.router:
        return const WeatherScreen();
      case SearchLocationScreen.router:
        return const SearchLocationScreen();
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
