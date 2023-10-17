enum TemperatureUnit {
  celsius,
  fahrenheit;

  @override
  String toString() {
    switch (this) {
      case TemperatureUnit.celsius:
        return '°C';
      case TemperatureUnit.fahrenheit:
        return '°F';
    }
  }
}

enum WeatherCondition {
  sunny,
  rainy;
  // TODO: add more
  

  static WeatherCondition fromWeatherCode(int code) {
    if (code < 20) return WeatherCondition.sunny;
    return WeatherCondition.rainy;
  }
}