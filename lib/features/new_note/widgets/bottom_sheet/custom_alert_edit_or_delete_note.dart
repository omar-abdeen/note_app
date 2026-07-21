import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/core/resources/color_manger.dart';
import 'package:note_app/core/resources/const_value.dart';

class CustomAlertEditOrDeleteNote extends StatelessWidget {
  const CustomAlertEditOrDeleteNote({
    super.key,
    required this.onTapAtDeleteButton,
    required this.onTapAtEditButton,
    required this.onPressedClosed,
  });

  final GestureTapCallback onTapAtDeleteButton;
  final GestureTapCallback onTapAtEditButton;
  final VoidCallback onPressedClosed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 15.h),
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: ColorManger.kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    ConstValue.kWhatDoYouWant,
                    style: TextStyle(
                      color: ColorManger.kBlackColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ConstValue.kSelect,
                    style: TextStyle(
                      color: ColorManger.kLightGreyColor,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 41.w),
              SizedBox(
                width: 16.w,
                height: 16.h,
                child: IconButton.filled(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(20.w, 20.h),
                    backgroundColor: ColorManger.kGrey2Color,
                  ),
                  onPressed:  onPressedClosed,
                  icon: Icon(
                    Icons.close,
                    size: 8.sp,
                    color: ColorManger.kGrey3Color,
                  ),
                  color: ColorManger.kWhiteColor,
                ),
              ),
              SizedBox(width: 16.w),
            ],
          ),
          SizedBox(height: 16.h),
          Divider(height: 0),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomOkButton(
                onTapAtEditButton:  onTapAtEditButton,
              ),
              SizedBox(width: 33.w),
              CustomDeleteButton(
                onTapAtDeleteButton:  onTapAtDeleteButton,
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}

class CustomDeleteButton extends StatelessWidget {
  const CustomDeleteButton({super.key, required this.onTapAtDeleteButton});

  final GestureTapCallback onTapAtDeleteButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  onTapAtDeleteButton,
      child: Column(
        children: [
          Icon(CupertinoIcons.delete, color: Colors.red),
          SizedBox(height: 7.h),
          Text(
            ConstValue.kDelete,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: ColorManger.kGrey3Color,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomOkButton extends StatelessWidget {
  const CustomOkButton({super.key, required this.onTapAtEditButton});

  final GestureTapCallback onTapAtEditButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTapAtEditButton,
      child: Column(
        children: [
          Icon(CupertinoIcons.pencil_circle, color: ColorManger.kPrimaryColor),
          SizedBox(height: 7.h),
          Text(
            ConstValue.kEdit,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              color: ColorManger.kGrey3Color,
            ),
          ),
        ],
      ),
    );
  }
}
