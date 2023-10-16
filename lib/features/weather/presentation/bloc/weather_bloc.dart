import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(super.initialState) {
    on<OnSearchLocations>(_onSearchLocations);
  }

  Future<void> _onSearchLocations(OnSearchLocations event, Emitter<WeatherState> emit) async {
    
  }
}