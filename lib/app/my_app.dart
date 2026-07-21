import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/color_manger.dart';
import 'package:note_app/core/resources/routes_manger.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Note App',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor:ColorManger.kWhiteColor,
        ),
        onGenerateRoute: RoutesManger.onGenerateRoute,
        initialRoute: RoutesName.homeScreenRoute,
      ),
    );
  }
}
