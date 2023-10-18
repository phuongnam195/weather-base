import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_base/core/base/base_bloc.dart';
import 'package:weather_base/core/di/injection.dart';
import 'package:weather_base/core/theme/app_colors.dart';
import 'package:weather_base/core/utils/dialog_utils.dart';
import 'package:weather_base/core/utils/sized_box.dart';
import 'package:weather_base/features/weather/presentation/widgets/appbar.dart';
import 'package:weather_base/features/weather/presentation/widgets/current_weather_panel.dart';
import 'package:weather_base/features/weather/presentation/widgets/today_weather_card.dart';

import '../bloc/location/location_bloc.dart';
import '../bloc/weather/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {
  static const router = '/weather';

  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    getIt<LocationBloc>().add(OnGetCurrentLocation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LocationBloc, BaseState>(
          bloc: getIt<LocationBloc>(),
          listenWhen: (prev, curr) => [CurrentLocationLoaded, ErrorState].contains(curr.runtimeType),
          listener: (ctx, state) {
            if (state is CurrentLocationLoaded) {
              getIt<WeatherBloc>().add(OnFetchWeatherData(state.location));
            } else if (state is ErrorState) {
              DialogUtils.showError(content: state.failure.message);
            }
          },
        ),
        BlocListener<WeatherBloc, BaseState>(
          bloc: getIt<WeatherBloc>(),
          listenWhen: (prev, curr) => [ErrorState].contains(curr.runtimeType),
          listener: (ctx, state) {
            if (state is ErrorState) {
              DialogUtils.showError(content: state.failure.message);
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackground(),
            _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              children: [
                sh(50.h),
                const WeatherAppBar(),
                sh(8.h),
                const CurrentWeatherPanel(),
                sh(20.h),
                const TodayWeatherCard(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
          child: BlocBuilder<WeatherBloc, BaseState>(
            bloc: getIt<WeatherBloc>(),
            buildWhen: (prev, curr) => [LoadingState, CurrentWeatherState].contains(curr.runtimeType),
            builder: (ctx, state) {
              if (state is LoadingState) {
                return const LinearProgressIndicator();
              }
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBackground() {
    return BlocBuilder<WeatherBloc, BaseState>(
      bloc: getIt<WeatherBloc>(),
      buildWhen: (prev, curr) => [WeatherConditionState].contains(curr.runtimeType),
      builder: (ctx, state) {
        List<Color> gradientColors = [AppColors.rainyLight, AppColors.sunnyLight];
        if (state is WeatherConditionState) {
          gradientColors = state.gradientColors;
        }
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        );
      },
    );
  }
}
