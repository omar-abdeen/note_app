import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/color_manger.dart';

class CustomTextFiledDescNote extends StatelessWidget {
  const CustomTextFiledDescNote({
    super.key, required this.desccontroller, required this.active, required this.textColor,
  });
  final TextEditingController desccontroller;
  final bool? active ;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: active,
      controller: desccontroller,
      style: TextStyle(
        color: textColor,
        fontSize: 23.sp,
        fontWeight: FontWeight.w400,
      ),
      maxLines: null,
      decoration: InputDecoration(
        hintText: 'Type something...',
        hintStyle: TextStyle(
          color: ColorManger.kLightGreyColor2,
          fontSize: 23.sp,
          fontWeight: FontWeight.w400,
        ),
        border: InputBorder.none,

      ),
    );
  }
}
