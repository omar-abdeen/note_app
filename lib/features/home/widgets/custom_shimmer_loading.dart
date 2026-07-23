import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:note_app/core/resources/color_manger.dart';

class CustomShimmerLoading extends StatelessWidget {
  const CustomShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(20),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisExtent: 135.h,
        crossAxisCount: 2,
        mainAxisSpacing: 9,
        crossAxisSpacing: 11,
      ),
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 7.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 46.w,
                    height: 53.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 50.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          width: 60.w,
                          height: 10.h,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Container(width: 100.w, height: 15.h, color: Colors.white),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                height: 30.h,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
