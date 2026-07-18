import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/color_manger.dart';
import 'package:note_app/core/resources/const_value.dart';
import 'package:note_app/features/home/widgets/custom_empty_check_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.kWhiteColor,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            ConstValue.appTitle,
            style: TextStyle(
              fontFamily: ConstValue.fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
      body: SafeArea(child: CustomEmptyCheckHomeScreen()),
    );
  }
}
