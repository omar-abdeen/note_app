import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/color_manger.dart';
import 'package:note_app/core/resources/const_value.dart';

class CustomAppBarNewScreen extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarNewScreen({
    super.key,
    required this.onPressedBack,
    required this.onPressedAtMark,
  });

  final VoidCallback onPressedBack;
  final VoidCallback onPressedAtMark;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManger.kWhiteColor,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: ElevatedButton(
            onPressed: onPressedAtMark,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(33.sp, 33.sp),
              backgroundColor: ColorManger.kPrimaryColor,
              shape: RoundedSuperellipseBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 8.sp),
            ),
            child: Icon(
              Icons.check_circle_outlined,
              size: 16.sp,
              color: ColorManger.kWhiteColor.withOpacity(0.75),
            ),
          ),
        ),
      ],
      leading: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManger.kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
          onPressed: onPressedBack,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(right: 30, top: 3),
        child: const Text(
          ConstValue.Back,
          style: TextStyle(
            color: ColorManger.kPrimaryColor,
            fontFamily: ConstValue.fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
