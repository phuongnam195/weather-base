import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_base/core/navigator/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

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
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: theme(context),
        initialRoute: AppRouter.initialRouter,
        navigatorObservers: [AppNavObserver()],
      ),
    );
  }
}
