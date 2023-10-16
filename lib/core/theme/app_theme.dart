import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_base/core/theme/app_colors.dart';
import 'package:weather_base/global.dart';

ThemeData appTheme(BuildContext context) {
  final themeData = ThemeData(
    appBarTheme: const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent)),
    textTheme: Theme.of(context).textTheme.copyWith(
          displayLarge: TextStyle(
            fontSize: 64.sp,
            color: AppColors.textWhite,
          ),
          titleLarge: TextStyle(
            fontSize: 32.sp,
            color: AppColors.textWhite,
          ),
          titleMedium: TextStyle(
            fontSize: 24.sp,
            color: AppColors.textWhite,
          ),
          titleSmall: TextStyle(
            fontSize: 20.sp,
            color: AppColors.textWhite,
          ),
          bodyLarge: TextStyle(
            fontSize: 18.sp,
            color: AppColors.textWhite,
          ),
          bodyMedium: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textWhite,
          ),
          bodySmall: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textWhite,
          ),
          labelMedium: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textWhite,
          ),
          labelSmall: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textWhite,
          ),
        ),
  );

  return themeData;
}

TextTheme get textTheme => Theme.of(Global.context).textTheme;
