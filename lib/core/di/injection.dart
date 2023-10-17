import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_base/core/di/injection.config.dart';
import 'package:weather_base/core/network/pretty_dio_logger.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(generateForDir: ["lib"])
configureDependencies() => getIt.init();

@module
abstract class AppModuleDepedenciesProvider {
  @singleton
  Dio provideNetworkDio() {
    var baseOptions = BaseOptions(
      validateStatus: (status) {
        return [200, 201, 204, 404, 422].contains(status);
      },
    );
    final dio = Dio(baseOptions);
    dio.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
    return dio;
  }
}
