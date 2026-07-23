import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/core/resources/color_manger.dart';
import 'package:note_app/core/resources/const_value.dart';
import 'package:note_app/features/home/widgets/custom_empty_check_home_screen.dart';
import 'package:note_app/features/home/widgets/custom_shimmer_loading.dart';
import 'package:note_app/model/note_model.dart';

class CustomGridViewNotesBody extends StatelessWidget {
  const CustomGridViewNotesBody({
    super.key,
    required this.outPutListNoteModel,
    required this.onTapAtNote,
    required this.isAscending,
  });

  final Stream<List<NoteModel>> outPutListNoteModel;
  final void Function(NoteModel data) onTapAtNote;
  final bool isAscending;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NoteModel>>(
      stream: outPutListNoteModel,
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
          ? CustomShimmerLoading()
          : snapshot.data == null
          ? SizedBox()
          : snapshot.data!.isEmpty
          ? CustomEmptyBodyHomeScreen()
          : GridView.builder(
              padding: EdgeInsets.all(20),
              itemCount: snapshot.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 135.h,
                crossAxisCount: 2,
                mainAxisSpacing: 9,
                crossAxisSpacing: 11,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onTapAtNote(snapshot.data![index]);
                },
                child: CustomItemNote(
                  displayIndex: isAscending
                      ? index + 1
                      : snapshot.data!.length - index,
                  noteModel: snapshot.data![index],
                  color: index % 5 == 0
                      ? ColorManger.listColorNotes[4]
                      : index % 4 == 0
                      ? ColorManger.listColorNotes[3]
                      : index % 3 == 0
                      ? ColorManger.listColorNotes[2]
                      : index % 2 == 0
                      ? ColorManger.listColorNotes[1]
                      : ColorManger.listColorNotes[0],
                ),
              ),
            ),
    );
  }
}

class CustomItemNote extends StatelessWidget {
  const CustomItemNote({
    super.key,
    required this.noteModel,
    required this.color,
    required this.displayIndex,
  });

  final NoteModel noteModel;
  final Color color;
  final int displayIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 7.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 25.h),
              SizedBox(
                width: 46.w,
                height: 53.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/background_id.svg',
                      width: 46.w,
                      height: 55.w,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      displayIndex.toString(),
                      style: TextStyle(
                        color: ColorManger.kWhiteColor,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButtonDoneStatus(
                      status:
                          noteModel.title.isNotEmpty &&
                          noteModel.description.isNotEmpty,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      noteModel.dateTime,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 8.sp,
                        color: ColorManger.kWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            noteModel.title,
            maxLines: 1,
            style: TextStyle(
              color: ColorManger.kWhiteColor,
              fontSize: 16.sp,
              fontFamily: ConstValue.fontFamily,
            ),
          ),
          Expanded(
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              noteModel.description,
              style: TextStyle(
                color: ColorManger.kGrey3Color,
                fontSize: 8.sp,
                fontFamily: ConstValue.fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ElevatedButtonDoneStatus extends StatelessWidget {
  const ElevatedButtonDoneStatus({super.key, required this.status});

  final bool status;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(0, 0),
          backgroundColor: status == true ? Color(0xff22573D): Color(0xFFF7DEE3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
        ),
        icon: Icon(
          status == true
              ? CupertinoIcons.checkmark_alt_circle_fill
              : CupertinoIcons.clear_circled_solid,
          color: status == true ? Color(0xff60D889) : Colors.red,
          size: 18.sp,
          weight: 1000,

        ),
        label: Text(
          status == true ? "done" : "Not done",
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: ConstValue.fontFamily,
            color: status == true ? ColorManger.kWhiteColor : Colors.red,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
