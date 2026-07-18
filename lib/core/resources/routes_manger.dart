import 'package:flutter/material.dart';
import 'package:note_app/core/widgets/route_not_found.dart';
import 'package:note_app/features/home/screens/home_screen.dart';
import 'package:note_app/features/new_note/screens/new_note_screen.dart';
import 'package:note_app/features/onBoarding/screens/on_boarding_screen.dart';

class RoutesManger {
  RoutesManger._();
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.onBoardingScreenRoute:
        return MaterialPageRoute(builder: (context) => OnBoardingScreen());
      case RoutesName.homeScreenRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.newNoteScreenRoute:
        return MaterialPageRoute(builder: (context) => const NewNoteScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const RouteNotFoundWidget(),
        );
    }
  }
}

class RoutesName {
  RoutesName._();
  static const String onBoardingScreenRoute = '/';
  static const String homeScreenRoute = '/homeScreen';
  static const String newNoteScreenRoute = '/newNoteScreen';
}
