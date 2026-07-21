import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/onboarding/on_boarding_controller.dart';
import 'package:note_app/core/resources/color_manger.dart';
import 'package:note_app/core/resources/const_value.dart';
import 'package:note_app/core/resources/image_manger.dart';
import 'package:note_app/core/resources/routes_manger.dart';
import 'package:note_app/core/widgets/custom_bottom.dart';

class CustomOnBoardingScreen extends StatefulWidget {
  const CustomOnBoardingScreen({super.key});

  @override
  State<CustomOnBoardingScreen> createState() => _CustomOnBoardingScreenState();
}

class _CustomOnBoardingScreenState extends State<CustomOnBoardingScreen> {
  late OnBoardingController _onBoardingController;
  @override
  void initState() {
    super.initState();
    _onBoardingController = OnBoardingController();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageManger.kOnBoardingImage,
                    width: 375.w,
                    height: 231.h,
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    ConstValue.onBoardingScreenTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 48.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: ConstValue.fontFamily,
                      color: ColorManger.kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    ConstValue.onBoardingScreenSubTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: ConstValue.fontFamily,
                      color: ColorManger.kLightGreyColor,
                    ),
                  ),
                  SizedBox(height: 50.h),
                  CustomBottom(
                    onTap: () {
                      _onBoardingController.goHomeScreen(
                        context,
                        RoutesName.homeScreenRoute,
                      );
                    },
                    Width: 75.w,
                    Height: 75.h,
                    offset: const Offset(0, 0),
                    blurRadius: 0,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 22.sp,
                    ),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
