import 'package:billflow/theme/app_theme.dart';
import 'package:billflow/utils/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Bill Flow',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          useInheritedMediaQuery: true,
          theme: AppTheme.lightMode(context),
          darkTheme: AppTheme.darkMode(context),
          // initialRoute: "/",
          initialRoute: "/auth/verify-mail",
          onGenerateRoute: OnGenerateRoute.generateRoute,
        );
      },
    );
  }
}
