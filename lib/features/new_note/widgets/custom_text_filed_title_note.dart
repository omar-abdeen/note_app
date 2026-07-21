import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/color_manger.dart';

class CustomTextFiledTitleNote extends StatelessWidget {
  const CustomTextFiledTitleNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: ColorManger.kBlackColor,
        fontSize: 48.sp,
        fontWeight: FontWeight.w400,
      ),
      maxLines: 1,
      decoration: InputDecoration(
        hintText: 'Title',
        hintStyle: TextStyle(
          color: ColorManger.kLightGreyColor2,
          fontSize: 48.sp,
          fontWeight: FontWeight.w400,
        ),
        border: InputBorder.none,
      ),
    );
  }
}
