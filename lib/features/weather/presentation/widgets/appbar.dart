import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_base/core/base/base_bloc.dart';
import 'package:weather_base/core/di/injection.dart';
import 'package:weather_base/core/extensions/ui_extensions.dart';
import 'package:weather_base/core/theme/app_colors.dart';
import 'package:weather_base/core/theme/app_theme.dart';
import 'package:weather_base/core/utils/sized_box.dart';
import 'package:weather_base/features/weather/domain/dto/location_dto.dart';
import 'package:weather_base/features/weather/presentation/bloc/location/location_bloc.dart';
import 'package:weather_base/features/weather/presentation/bloc/weather/weather_bloc.dart';
import 'package:weather_base/features/weather/presentation/screens/search_location_screen.dart';

class WeatherAppBar extends StatelessWidget {
  const WeatherAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.location_on_outlined, size: 26.w, color: AppColors.white),
        InkWell(
          onTap: () async {
            final result = await Navigator.of(context).pushNamed(SearchLocationScreen.router);
            if (result is LocationDto) {
              getIt<WeatherBloc>().add(OnFetchWeatherData(result));
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuilder<WeatherBloc, BaseState>(
                  bloc: getIt<WeatherBloc>(),
                  buildWhen: (prev, curr) => [LocationSelected].contains(curr.runtimeType),
                  builder: (ctx, state) {
                    if (state is LocationSelected) {
                      return Text(
                      state.location.name,
                      style: textTheme.bodyLarge!.semiBold(),
                    );
                    }
                    return Text(
                      'Chọn thành phố',
                      style: textTheme.bodyLarge,
                    );
                  },
                ),
                sw(12.w),
                Icon(Icons.expand_more_rounded, size: 24.w, color: AppColors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
