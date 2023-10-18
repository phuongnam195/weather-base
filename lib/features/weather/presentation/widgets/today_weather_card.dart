import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_base/core/base/base_bloc.dart';
import 'package:weather_base/core/constants/assets.dart';
import 'package:weather_base/core/constants/enums.dart';
import 'package:weather_base/core/di/injection.dart';
import 'package:weather_base/core/extensions/ui_extensions.dart';
import 'package:weather_base/core/theme/app_colors.dart';
import 'package:weather_base/core/theme/app_theme.dart';
import 'package:weather_base/core/utils/sized_box.dart';
import 'package:weather_base/features/weather/domain/dto/hourly_weather_dto.dart';

import '../bloc/weather/weather_bloc.dart';

class TodayWeatherCard extends StatelessWidget {
  const TodayWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, BaseState>(
      bloc: getIt<WeatherBloc>(),
      buildWhen: (prev, curr) => [TodayWeatherState].contains(curr.runtimeType),
      builder: (ctx, state) {
        WeatherCondition currentCondition = WeatherCondition.sunny;
        List<HourlyWeatherDto> nextHourlyWeather = [];
        if (state is TodayWeatherState) {
          currentCondition = state.currentCondition;
          nextHourlyWeather = state.nextHourlyWeather;
        }
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: currentCondition == WeatherCondition.sunny ? AppColors.sunnyShadow : AppColors.rainyShadow,
          ),
          padding: EdgeInsets.symmetric(vertical: 13.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Hôm nay', style: textTheme.titleSmall!.bold()),
                    Text(DateFormat('d MMM', 'vi_VN').format(DateTime.now()), style: textTheme.bodyLarge),
                  ],
                ),
              ),
              sh(12.h),
              if (nextHourlyWeather.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < 4; i++)
                        _column(
                          nextHourlyWeather[i].temperature.round(),
                          nextHourlyWeather[i].isDay,
                          nextHourlyWeather[i].time.hour,
                        ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _column(int temp, bool isDay, int hour) {
    return Column(
      children: [
        sh(13.h),
        Text('$temp°C', style: textTheme.bodyLarge),
        sh(20.h),
          Image.asset(
           isDay ? Assets.img.dayCloud : Assets.img.nightCloud,
            width: 40.w,
            fit: BoxFit.fitWidth,
          ),
        sh(25.h),
        Text('${'$hour'.padLeft(2, '0')}.00', style: textTheme.bodyLarge),
        sh(20.h),
      ],
    );
  }
}
