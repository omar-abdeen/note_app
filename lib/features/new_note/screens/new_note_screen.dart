import 'package:flutter/material.dart';
import 'package:note_app/controller/new_note_controller/new_note_controller.dart';
import 'package:note_app/core/resources/color_manger.dart';
import 'package:note_app/features/new_note/widgets/custom_app_bar_new_screen.dart';
import 'package:note_app/features/new_note/widgets/custom_text_filed_desc_note.dart';
import 'package:note_app/features/new_note/widgets/custom_text_filed_title_note.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({super.key});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  late NewNoteController _controller;

  @override
  void initState() {
    super.initState();
    _controller = NewNoteController(context);
  }
  @override
  void dispose() {
    _controller.disposeController();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    _controller.getArgumentNote();
    return Scaffold(
      appBar: CustomAppBarNewScreen(
        controller: _controller,
        editNow: _controller.editStatus,
        onPressedBack: _controller.goBack,
        onPressedAtMark: () {
          _controller.onTapAtMark();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: StreamBuilder<bool?>(
            stream: _controller.outPutEditStatus,
            builder: (context, editSnapshot) {
              return StreamBuilder<Color>(
                stream: _controller.outPutTextColor,
                initialData: ColorManger.kLightGreyColor2,
                builder: (context, colorSnapshot) {
                  return Column(
                    children: [
                      CustomTextFiledTitleNote(
                        active: editSnapshot.data,
                        titlecontroller: _controller.titlecontroller,
                        textColor: colorSnapshot.data ?? Colors.black,
                      ),
                      Expanded(
                        child: CustomTextFiledDescNote(
                          active: editSnapshot.data,
                          desccontroller: _controller.desccontroller,
                          textColor: colorSnapshot.data ?? Colors.black,
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          ),
        ),
      ),
    );
  }
}
