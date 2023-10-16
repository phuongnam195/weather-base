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
import 'package:weather_base/core/di/injection.dart' as _i8;
import 'package:weather_base/features/weather/data/datasources/location_remote_data_source.dart'
    as _i4;
import 'package:weather_base/features/weather/data/repositories/location_repo_impl.dart'
    as _i6;
import 'package:weather_base/features/weather/domain/repositories/location_repo.dart'
    as _i5;
import 'package:weather_base/features/weather/domain/usecases/search_locations_use_case.dart'
    as _i7;

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
    gh.singleton<_i3.Dio>(appModuleDepedenciesProvider.provideNetworkDio());
    gh.singleton<_i4.LocationRemoteDataSource>(
        locationRemoteDataSourceProvider.provide(gh<_i3.Dio>()));
    gh.lazySingleton<_i5.LocationRepo>(
        () => _i6.LocationRepoRepoImpl(gh<_i4.LocationRemoteDataSource>()));
    gh.lazySingleton<_i7.SearchLocationsUseCase>(
        () => _i7.SearchLocationsUseCase(gh<_i5.LocationRepo>()));
    return this;
  }
}

class _$AppModuleDepedenciesProvider extends _i8.AppModuleDepedenciesProvider {}

class _$LocationRemoteDataSourceProvider
    extends _i4.LocationRemoteDataSourceProvider {}
