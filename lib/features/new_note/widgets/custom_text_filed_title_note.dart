import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/color_manger.dart';

class CustomTextFiledTitleNote extends StatelessWidget {
  const CustomTextFiledTitleNote({
    super.key,
    required this.titlecontroller,
    required this.active,
    required this.textColor,
  });

  final TextEditingController titlecontroller;
  final bool? active;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: active,
      controller: titlecontroller,
      style: TextStyle(
        color: textColor,
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
