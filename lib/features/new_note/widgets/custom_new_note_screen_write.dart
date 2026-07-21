import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/color_manger.dart';

class CustomNewNoteScreenWrite extends StatelessWidget {
  const CustomNewNoteScreenWrite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        child: Column(
          children: [
            TextFormField(
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
            ),
            Expanded(
              child: TextFormField(
                style: TextStyle(
                  color: ColorManger.kBlackColor,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
