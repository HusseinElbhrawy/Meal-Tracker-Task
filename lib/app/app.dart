import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/config/routes/app_navigation.dart';
import 'package:meal_tracker/config/routes/app_routes.dart';
import 'package:meal_tracker/config/theme/light_theme.dart';
import 'package:meal_tracker/core/utils/app_colors.dart';
import 'package:meal_tracker/core/utils/app_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => MaterialApp(
        title: AppStrings.appName,
        color: AppColors.primaryColor,
        // supportedLocales: const [Locale('ar'), Locale('en')],
        // locale: const Locale('en'),
        debugShowCheckedModeBanner: false,
        navigatorObservers: [BotToastNavigatorObserver()],
        builder: BotToastInit(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        navigatorKey: AppNavigation.navigatorKey,
        theme: kLightTheme,

        themeMode: ThemeMode.light,
        initialRoute: Routes.splashRoute,
      ),
    );
  }
}
