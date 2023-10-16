import 'package:flutter/material.dart';
import 'package:weather_base/core/di/injection.dart';
import 'package:weather_base/features/weather/domain/usecases/search_locations_use_case.dart';

class WeatherScreen extends StatefulWidget {
  static const router = '/weather';

  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    getIt<SearchLocationsUseCase>().call('London');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}