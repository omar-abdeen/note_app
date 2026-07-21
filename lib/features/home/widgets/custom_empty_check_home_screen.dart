import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/home/home_controller.dart';
// ignore: unused_import
import 'package:note_app/core/resources/color_manger.dart';
import 'package:note_app/core/resources/const_value.dart';
import 'package:note_app/core/resources/image_manger.dart';
import 'package:note_app/core/resources/routes_manger.dart';
import 'package:note_app/core/widgets/custom_bottom.dart';

class CustomEmptyCheckHomeScreen extends StatefulWidget {
  const CustomEmptyCheckHomeScreen({super.key});

  @override
  State<CustomEmptyCheckHomeScreen> createState() => _CustomEmptyCheckHomeScreenState();
}

class _CustomEmptyCheckHomeScreenState extends State<CustomEmptyCheckHomeScreen> {
  late HomeController _homeController;
  @override
  void initState() {
    super.initState();
    _homeController = HomeController();
  }
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 110.h),
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
                  SizedBox(height: 150.h),
                  CustomBottom(
                    onTap: () {
                      _homeController.goNewNote(context, RoutesName.newNoteScreenRoute);
                    },
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
        );
      },
    );
  }
}
