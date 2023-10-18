import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_base/core/base/base_bloc.dart';
import 'package:weather_base/core/constants/assets.dart';
import 'package:weather_base/core/constants/enums.dart';
import 'package:weather_base/core/di/injection.dart';
import 'package:weather_base/core/extensions/ui_extensions.dart';
import 'package:weather_base/core/theme/app_colors.dart';
import 'package:weather_base/core/theme/app_theme.dart';
import 'package:weather_base/core/utils/sized_box.dart';
import 'package:weather_base/features/weather/domain/dto/daily_weather_dto.dart';

import '../bloc/weather/weather_bloc.dart';

class ForecastWeatherCard extends StatelessWidget {
  const ForecastWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, BaseState>(
      bloc: getIt<WeatherBloc>(),
      buildWhen: (prev, curr) => [NextDaysWeatherState].contains(curr.runtimeType),
      builder: (ctx, state) {
        WeatherCondition currentCondition = WeatherCondition.sunny;
        List<DailyWeatherDto> nextDaysWeather = [];
        if (state is NextDaysWeatherState) {
          currentCondition = state.currentCondition;
          nextDaysWeather = state.nextDaysWeather;
        }
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: currentCondition == WeatherCondition.sunny ? AppColors.sunnyShadow : AppColors.rainyShadow,
          ),
          padding: EdgeInsets.symmetric(vertical: 13.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Dự báo', style: textTheme.titleSmall!.bold()),
                  ],
                ),
              ),
              sh(12.h),
              if (nextDaysWeather.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < nextDaysWeather.length; i++)
                        _row(
                          nextDaysWeather[i].date,
                          nextDaysWeather[i].condition,
                          nextDaysWeather[i].minTemperature.round(),
                          nextDaysWeather[i].maxTemperature.round(),
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

  Widget _row(DateTime date, WeatherCondition condition, int minTemp, int maxTemp) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(DateFormat('EEE', 'vi_VN').format(date), style: textTheme.bodyLarge),
        ),
        Image.asset(
          condition == WeatherCondition.sunny ? Assets.img.sunny : Assets.img.rainy,
          width: 50.w,
          fit: BoxFit.fitWidth,
        ),
        Expanded(
          flex: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('$maxTemp°C', style: textTheme.bodyMedium!.regular()),
              sw(8.w),
              Text(
                '$minTemp°C',
                style: textTheme.bodyMedium!.regular().copyWith(color: AppColors.white.withOpacity(0.5)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
