import 'package:flutter/material.dart';
import 'package:note_app/features/onBoarding/widgets/custom_onboarding_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: CustomOnBoardingScreen(),
      ),
    );
  }
}