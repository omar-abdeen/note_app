import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/resources/const_value.dart';
import 'package:note_app/features/new_note/widgets/bottom_sheet/custom_body_model_bottom_sheet_new_note.dart';

class NewNoteController {
  BuildContext context;

  NewNoteController(this.context) {
    initController();
  }

  late TextEditingController titlecontroller;
  late TextEditingController desccontroller;

  Future<void> initController() async {
    titlecontroller = TextEditingController();
    desccontroller = TextEditingController();
  }

  Future<void> disposeController() async {
    titlecontroller.dispose();
    desccontroller.dispose();
  }

  void goBack() {
    Navigator.of(context).pop();
  }

  void onTapAtMark() {
    addNewNote();
  }

  void addNewNote() {
    String requiredData = "";
    if (titlecontroller.text.trim().isEmpty || desccontroller.text.isEmpty) {
      //requiredData += "Title and description are required\n";
      showBottomSheet();
    } else {}
  }

  void showBottomSheet() {
     FocusScope.of(context).unfocus();
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return CustomBodyModelBottomSheetNewNote(
          onTapAtDeleteButton: onTapAtDeleteButton,
          onTapAtOkButton: onTapAtOkButton,
          onPressedClosed: onPressedClosed,
        );
      },
    );
  }

  void onTapAtDeleteButton() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  void onTapAtOkButton() {
    Navigator.of(context).pop();
  }

  void onPressedClosed() {
    Navigator.of(context).pop();
  }
}
