import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_base/core/di/injection.dart';
import 'package:weather_base/core/navigator/app_routes.dart';
import 'package:weather_base/core/theme/app_theme.dart';
import 'package:weather_base/global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  configureDependencies();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(423, 752),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (ctx, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather Base',
        navigatorKey: Global.globalKey,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: appTheme(context),
        initialRoute: AppRoutes.initial,
      ),
    );
  }
}
