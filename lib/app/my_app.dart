import 'package:flutter/material.dart';
import 'package:note_app/core/routes_manger.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Note App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      onGenerateRoute: RoutesManger.onGenerateRoute,
      initialRoute: RoutesName.onBoardingScreenRoute,
    );
  }
}
