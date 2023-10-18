// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weather_base/core/di/injection.dart' as _i15;
import 'package:weather_base/features/weather/data/datasources/location_remote_data_source.dart'
    as _i5;
import 'package:weather_base/features/weather/data/datasources/weather_remote_data_source.dart'
    as _i9;
import 'package:weather_base/features/weather/data/repositories/location_repo_impl.dart'
    as _i7;
import 'package:weather_base/features/weather/data/repositories/weather_repo_impl.dart'
    as _i11;
import 'package:weather_base/features/weather/domain/repositories/location_repo.dart'
    as _i6;
import 'package:weather_base/features/weather/domain/repositories/weather_repo.dart'
    as _i10;
import 'package:weather_base/features/weather/domain/usecases/get_current_location_use_case.dart'
    as _i4;
import 'package:weather_base/features/weather/domain/usecases/get_weather_data_use_case.dart'
    as _i12;
import 'package:weather_base/features/weather/domain/usecases/search_locations_use_case.dart'
    as _i8;
import 'package:weather_base/features/weather/presentation/bloc/location/location_bloc.dart'
    as _i13;
import 'package:weather_base/features/weather/presentation/bloc/weather/weather_bloc.dart'
    as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModuleDepedenciesProvider = _$AppModuleDepedenciesProvider();
    final locationRemoteDataSourceProvider =
        _$LocationRemoteDataSourceProvider();
    final weatherRemoteDataSourceProvider = _$WeatherRemoteDataSourceProvider();
    gh.singleton<_i3.Dio>(appModuleDepedenciesProvider.provideNetworkDio());
    gh.lazySingleton<_i4.GetCurrentLocationUseCase>(
        () => _i4.GetCurrentLocationUseCase());
    gh.singleton<_i5.LocationRemoteDataSource>(
        locationRemoteDataSourceProvider.provide(gh<_i3.Dio>()));
    gh.lazySingleton<_i6.LocationRepo>(
        () => _i7.LocationRepoRepoImpl(gh<_i5.LocationRemoteDataSource>()));
    gh.lazySingleton<_i8.SearchLocationsUseCase>(
        () => _i8.SearchLocationsUseCase(gh<_i6.LocationRepo>()));
    gh.singleton<_i9.WeatherRemoteDataSource>(
        weatherRemoteDataSourceProvider.provide(gh<_i3.Dio>()));
    gh.lazySingleton<_i10.WeatherRepo>(
        () => _i11.WeatherRepoRepoImpl(gh<_i9.WeatherRemoteDataSource>()));
    gh.lazySingleton<_i12.GetWeatherDataUseCase>(
        () => _i12.GetWeatherDataUseCase(gh<_i10.WeatherRepo>()));
    gh.lazySingleton<_i13.LocationBloc>(() => _i13.LocationBloc(
          gh<_i8.SearchLocationsUseCase>(),
          gh<_i4.GetCurrentLocationUseCase>(),
        ));
    gh.lazySingleton<_i14.WeatherBloc>(
        () => _i14.WeatherBloc(gh<_i12.GetWeatherDataUseCase>()));
    return this;
  }
}

class _$AppModuleDepedenciesProvider
    extends _i15.AppModuleDepedenciesProvider {}

class _$LocationRemoteDataSourceProvider
    extends _i5.LocationRemoteDataSourceProvider {}

class _$WeatherRemoteDataSourceProvider
    extends _i9.WeatherRemoteDataSourceProvider {}
