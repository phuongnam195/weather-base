import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:injectable/injectable.dart';
import 'package:location/location.dart' as loc;
import 'package:weather_base/core/base/failures.dart';
import 'package:weather_base/core/base/usecase.dart';

import '../dto/location_dto.dart';

@lazySingleton
class GetCurrentLocationUseCase extends EitherUseCase<LocationDto, NoParams> {
  @override
  Future<Either<Failure, LocationDto>> call(NoParams param) async {
    final location = loc.Location();

    bool serviceEnabled;
    loc.PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return const Left(Failure('Dịch vụ định vị không được bật'));
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        return const Left(Failure('Ứng dụng không được cấp quyền định vị'));
      }
    }

    final locationData = await location.getLocation();
    if (locationData.latitude == null || locationData.longitude == null) {
      return const Left(Failure('Không thể lấy vị trí hiện tại'));
    }
    List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
      locationData.latitude!,
      locationData.longitude!,
    );
    final firstPlacemark = placemarks.first;
    final locationDto = LocationDto(
      id: firstPlacemark.hashCode,
      name: firstPlacemark.name ?? 'Không xác định',
      country: firstPlacemark.country ?? '',
      latitude: locationData.latitude!,
      longitude: locationData.longitude!,
    );
    return Right(locationDto);
  }
}
