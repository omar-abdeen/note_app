import 'package:flutter/material.dart';
import 'package:note_app/features/onBoarding/widgets/custom_onboarding_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: CustomOnBoardingScreen(),
      ),
    );
  }
}