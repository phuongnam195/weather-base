import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_base/core/base/base_bloc.dart';
import 'package:weather_base/core/constants/assets.dart';
import 'package:weather_base/core/constants/enums.dart';
import 'package:weather_base/core/di/injection.dart';
import 'package:weather_base/core/extensions/ui_extensions.dart';
import 'package:weather_base/core/theme/app_colors.dart';
import 'package:weather_base/core/theme/app_theme.dart';
import 'package:weather_base/core/utils/sized_box.dart';

import '../bloc/weather/weather_bloc.dart';

class CurrentWeatherPanel extends StatelessWidget {
  const CurrentWeatherPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<WeatherBloc, BaseState>(
          bloc: getIt<WeatherBloc>(),
          buildWhen: (prev, curr) => [WeatherConditionState].contains(curr.runtimeType),
          builder: (ctx, state) {
            final imageAsset = state is WeatherConditionState ? state.imageAsset : null;
            return SizedBox(
              height: 187.h,
              child: imageAsset == null ? null : Image.asset(imageAsset, fit: BoxFit.fitHeight),
            );
          },
        ),
        BlocBuilder<WeatherBloc, BaseState>(
          bloc: getIt<WeatherBloc>(),
          buildWhen: (prev, curr) => [CurrentWeatherState].contains(curr.runtimeType),
          builder: (ctx, state) {
            WeatherCondition condition = WeatherCondition.sunny;
            double? temperature;
            double? rain;
            double? humidity;
            double? wind;
            if (state is CurrentWeatherState) {
              condition = state.condition;
              temperature = state.temperature;
              rain = state.rain;
              humidity = state.humidity;
              wind = state.wind;
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(temperature == null ? '' : '$temperature°', style: textTheme.displayLarge!.semiBold()),
                sh(35.h),
                _SubInfoCard(
                  rain: rain,
                  humidity: humidity,
                  wind: wind,
                  backgroundColor: condition == WeatherCondition.sunny ? AppColors.sunnyShadow : AppColors.rainyShadow,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _SubInfoCard extends StatelessWidget {
  const _SubInfoCard({
    required this.rain,
    required this.humidity,
    required this.wind,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  final double? rain;
  final double? humidity;
  final double? wind;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: backgroundColor,
      ),
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _item(Assets.ic.rain, '${rain ?? '-'} mm'),
          _item(Assets.ic.humidity, '${humidity ?? '-'}%'),
          _item(Assets.ic.wind, '${wind ?? '-'} km/h'),
        ],
      ),
    );
  }

  Widget _item(String svgAsset, String label) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(svgAsset, width: 24.w, fit: BoxFit.fitWidth),
          sw(5.w),
          Text(label, style: textTheme.bodySmall!.bold()),
        ],
      ),
    );
  }
}
