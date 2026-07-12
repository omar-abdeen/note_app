import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/color_manger.dart';
import 'package:note_app/core/resources/const_value.dart';
import 'package:note_app/core/resources/image_manger.dart';
import 'package:note_app/core/widgets/custom_bottom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
          child: Container(
            //color: ColorManger.kBlackColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageManger.kOnBoardingImage,
                  width: 350.w,
                  height: 286.73.h,
                ),
                Text(
                  textAlign: TextAlign.center,
                  ConstValue.appSubTitle,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: ConstValue.fontFamily,
                  ),
                ),
                SizedBox(height: 160.h),
                CustomBottom(
                  onTap: () {},
                  icon: Icon(Icons.add, color: Colors.white, size: 48.sp),
                  alignment: Alignment.centerRight,
                  offset: const Offset(-5, 5),
                  blurRadius: 10,
                  Width: 70.w,
                  Height: 70.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
