import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/new_note_controller/new_note_controller.dart';
import 'package:note_app/core/resources/color_manger.dart';
import 'package:note_app/core/resources/const_value.dart';

class CustomAppBarNewScreen extends StatefulWidget
    implements PreferredSizeWidget {
  const CustomAppBarNewScreen({
    super.key,
    required this.onPressedBack,
    required this.onPressedAtMark,
    required this.editNow,
    required this.controller,
  });

  final VoidCallback onPressedBack;
  final VoidCallback onPressedAtMark;
  final bool? editNow;
  final NewNoteController controller;

  @override
  State<CustomAppBarNewScreen> createState() => _CustomAppBarNewScreenState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarNewScreenState extends State<CustomAppBarNewScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.controller.outPutEditStatus,
      builder: (context, snapshot) {
        return AppBar(
          backgroundColor: ColorManger.kWhiteColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: ElevatedButton(
                onPressed: widget.onPressedAtMark,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(33.sp, 33.sp),
                  backgroundColor: ColorManger.kPrimaryColor,
                  shape: RoundedSuperellipseBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.sp,
                    vertical: 8.sp,
                  ),
                ),
                child: Icon(
                  snapshot.data == true
                      ? Icons.edit
                      : CupertinoIcons.check_mark_circled,
                  size: 16.sp,
                  color: ColorManger.kWhiteColor.withOpacity(0.75),
                ),
              ),
            ),
            StreamBuilder<Color>(
              stream: widget.controller.outPutTextColor,
              builder: (context, colorSnapshot) {
                return PopupMenuButton<Color>(
                  icon: Icon(Icons.palette, color: ColorManger.kPrimaryColor),
                  onSelected: (color) {
                    widget.controller.updateTextColor(color);
                  },
                  itemBuilder: (context) => [
                    _buildColorItem(Colors.black),
                    _buildColorItem(Colors.red),
                    _buildColorItem(Colors.blue),
                    _buildColorItem(Colors.green),
                    _buildColorItem(Colors.orange),
                    _buildColorItem(Colors.purple),
                  ],
                );
              },
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
              onPressed: widget.onPressedBack,
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
      },
    );
  }

  PopupMenuItem<Color> _buildColorItem(Color color) {
    return PopupMenuItem(
      value: color,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey),
        ),
      ),
    );
  }
}
