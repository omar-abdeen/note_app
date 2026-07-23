import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/color_manger.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(70.w, 70.h),
        backgroundColor: ColorManger.kPrimaryColor,
        shape: CircleBorder(),
      ),
      onPressed: onPressed,
      child: Container(
        width: 70.w,
        height: 70.h,
        decoration: BoxDecoration(
          color: ColorManger.kPrimaryColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0x66000000),
              offset: const Offset(-5, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(child: Icon(Icons.add,
          color: Colors.white,
          size: 35.sp,)),
      ),
    );
  }
}