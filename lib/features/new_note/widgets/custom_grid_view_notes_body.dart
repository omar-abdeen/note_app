import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/controller/home/home_controller.dart';
import 'package:note_app/core/resources/color_manger.dart';
import 'package:note_app/core/resources/const_value.dart';
import 'package:note_app/features/home/widgets/custom_empty_check_home_screen.dart';
import 'package:note_app/model/note_model.dart';

class CustomGridViewNotesBody extends StatelessWidget {
  const CustomGridViewNotesBody({
    super.key,
    required this.outPutListNoteModel,
    required this.onTapAtNote,
  });

  final Stream<List<NoteModel>> outPutListNoteModel;
  final void Function(NoteModel data) onTapAtNote;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NoteModel>>(
      stream: outPutListNoteModel,
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
          ? Center(child: CircularProgressIndicator())
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
  });

  final NoteModel noteModel;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 46.w,
                height: 46.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/background_id.svg',
                      width: 46.w,
                      height: 46.w,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      noteModel.id.toString(),
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
                    ElevatedButtonDoneStatus(status: noteModel.done),
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
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: status == true ? Color(0xff02463d) : Color(0xfff7dee3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      ),
      label: Text(
        status == true ? "Done" : "Not Done",
        style: TextStyle(
          fontSize: 10.sp,
          fontFamily: ConstValue.fontFamily,
          color: status == true ? ColorManger.kWhiteColor : Colors.red,
        ),
      ),
      icon: Icon(
        status == true
            ? CupertinoIcons.checkmark_alt_circle_fill
            : CupertinoIcons.clear_circled_solid,
        color: status == true ? ColorManger.kLightGreyColor : Colors.red,
      ),
      onPressed: () {},
    );
  }
}
