import 'package:flutter/material.dart';
import 'package:note_app/controller/new_note_controller/new_note_controller.dart';
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
    return Scaffold(
      appBar: CustomAppBarNewScreen(
        onPressedBack: _controller.goBack,
        onPressedAtMark: () {
          _controller.onTapAtMark();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              CustomTextFiledTitleNote(
                titlecontroller: _controller.titlecontroller,
              ),
              Expanded(child: CustomTextFiledDescNote(
                desccontroller: _controller.desccontroller,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
