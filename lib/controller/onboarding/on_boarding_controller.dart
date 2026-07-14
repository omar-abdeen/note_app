import 'package:flutter/material.dart';

class OnBoardingController {
  void goHomeScreen(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }
}
