import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_base/core/base/base_bloc.dart';
import 'package:weather_base/core/base/bloc_concurrency.dart';
import 'package:weather_base/core/base/failures.dart';
import 'package:weather_base/core/base/usecase.dart';
import 'package:weather_base/core/extensions/number_extensions.dart';
import 'package:weather_base/features/weather/domain/dto/location_dto.dart';
import 'package:weather_base/features/weather/domain/usecases/get_current_location_use_case.dart';
import 'package:weather_base/features/weather/domain/usecases/search_locations_use_case.dart';

part 'location_event.dart';
part 'location_state.dart';

@lazySingleton
class LocationBloc extends Bloc<LocationEvent, BaseState> {
  final SearchLocationsUseCase _searchLocationsUseCase;
  final GetCurrentLocationUseCase _getCurrentLocationUseCase;

  LocationBloc(
    this._searchLocationsUseCase,
    this._getCurrentLocationUseCase,
  ) : super(InitialState()) {
    on<OnGetCurrentLocation>(_onGetCurrentLocation);
    on<OnEditSearch>(_onEditSearch, transformer: BlocConcurrency.debounce(300.milliseconds));
    on<OnSearchLocations>(_onSearchLocations, transformer: BlocConcurrency.restartable());
    on<OnSelectLocation>(_onSelectLocation);
  }

  void _onGetCurrentLocation(OnGetCurrentLocation event, Emitter<BaseState> emit) async {
    final either = await _getCurrentLocationUseCase.call(NoParams());
    either.fold(
      (Failure failure) => emit(ErrorState(failure)),
      (LocationDto data) => emit(CurrentLocationLoaded(data)),
    );
  }

  void _onEditSearch(OnEditSearch event, Emitter<BaseState> emit) {
    add(OnSearchLocations(event.keyword));
  }

  Future<void> _onSearchLocations(OnSearchLocations event, Emitter<BaseState> emit) async {
    if (event.keyword.isEmpty) {
      emit(LocationSearched(null));
      return;
    }
    emit(LoadingState());
    final either = await _searchLocationsUseCase.call(event.keyword);
    either.fold(
      (Failure failure) => emit(ErrorState(failure)),
      (List<LocationDto> data) => emit(LocationSearched(data)),
    );
  }

  void _onSelectLocation(OnSelectLocation event, Emitter<BaseState> emit) {
    emit(LocationSelected(event.location));
  }
}
