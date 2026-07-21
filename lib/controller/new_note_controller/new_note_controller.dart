import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/database/hive/hive_helper.dart';
import 'package:note_app/core/resources/const_value.dart';
import 'package:note_app/features/new_note/widgets/bottom_sheet/custom_body_model_bottom_sheet_new_note.dart';
import 'package:note_app/model/note_model.dart';

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
    } else {
      addNewNoteHive();
    }
  }

  Future<int> getIdDefulteNote() async {
    HiveHelper<int> hiveHelper = HiveHelper<int>(ConstValue.IDNoteBox);
    int? id = await hiveHelper.getValue(key: 'id');
    return id ?? 0;
  }
  Future<void> getIDDefulteNote(int id) async {
    HiveHelper<int> hiveHelper = HiveHelper<int>(ConstValue.IDNoteBox);
    await hiveHelper.addValue(key: 'id', value: id);
  }
  Future<void> addNewNoteHive() async {
    int? id = await getIdDefulteNote();
    id++;
    NoteModel noteModel = NoteModel(
      id: id,
      title: titlecontroller.text.trim(),
      description: desccontroller.text.trim(),
      dateTime: DateTime.now().toString(),
      done: false,
    );
    HiveHelper<NoteModel> hiveHelper = HiveHelper<NoteModel>(
      ConstValue.NoteBox,
    );
    await hiveHelper.addValue(key: id.toString(), value: noteModel);
    await getIDDefulteNote(id);
    Navigator.of(context).pop();
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
