import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/database/hive/hive_helper.dart';
import 'package:note_app/core/resources/const_value.dart';
import 'package:note_app/features/new_note/widgets/bottom_sheet/custom_alert_edit_or_delete_note.dart';
import 'package:note_app/features/new_note/widgets/bottom_sheet/custom_body_model_bottom_sheet_new_note.dart';
import 'package:note_app/model/note_model.dart';

class NewNoteController {
  BuildContext context;
  NoteModel? noteModel;
  bool? editStatus;

  NewNoteController(this.context) {
    start();
  }

  late TextEditingController titlecontroller;
  late TextEditingController desccontroller;
  late StreamController<bool?> _editStatusController;
  late Sink<bool?> _inputEditStatus;
  late Stream<bool?> outPutEditStatus;

  Future<void> start() async {
    await initController();
  }

  Future<void> initController() async {
    titlecontroller = TextEditingController();
    desccontroller = TextEditingController();
    _editStatusController = StreamController();
    _inputEditStatus = _editStatusController.sink;
    outPutEditStatus = _editStatusController.stream.asBroadcastStream();

    // Default to true for new notes so the user can type immediately
    editStatus = true;
    _inputEditStatus.add(editStatus);
  }

  Future<void> disposeController() async {
    titlecontroller.dispose();
    desccontroller.dispose();
  }

  void goBack() {
    Navigator.of(context).pop();
  }

  Future<void> onTapAtMark() async {
    if (titlecontroller.text.trim().isEmpty &&
        desccontroller.text.trim().isEmpty) {
      showBottomSheet();
    } else {
      if (noteModel == null) {
        await addNewNoteHive();
        goBack();
      } else {
        if (editStatus == true) {
          await editNoteHive();
        } else {
          showAlertEditORDeleteNoteBottomSheet();
        }
      }
    }
  }

  void addNewNote() {
    if (titlecontroller.text.trim().isEmpty &&
        desccontroller.text.trim().isEmpty) {
      showBottomSheet();
    }
  }

  void addNewThisNote() async {
    if (titlecontroller.text.trim().isEmpty &&
        desccontroller.text.trim().isEmpty) {
      showBottomSheet();
    } else {
      await editNoteHive();
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
    editStatus = false;
    _inputEditStatus.add(editStatus);
  }

  Future<void> editNoteHive() async {
    NoteModel noteMode = NoteModel(
      id: noteModel!.id,
      title: titlecontroller.text.trim(),
      description: desccontroller.text.trim(),
      dateTime: DateTime.now().toString(),
      done: false,
    );
    HiveHelper<NoteModel> hiveHelper = HiveHelper<NoteModel>(
      ConstValue.NoteBox,
    );
    await hiveHelper.addValue(key: noteModel!.id.toString(), value: noteMode);
    editStatus = false;
    _inputEditStatus.add(editStatus);
  }

  void showAlertEditORDeleteNoteBottomSheet() {
    FocusScope.of(context).unfocus();
    showModalBottomSheet(
      // isDismissible: false,
      backgroundColor: Colors.transparent,

      context: context,
      builder: (context) => CustomAlertEditOrDeleteNote(
        onTapAtDeleteButton: onTapAtINEditStatusDeleteButton,
        onTapAtEditButton: onTapAtINEditStatusEditButton,
        onPressedClosed: onPressedClosed,
      ),
    );
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

  Future<void> onTapAtINEditStatusDeleteButton() async {
    HiveHelper<NoteModel> hiveHelper = HiveHelper(ConstValue.NoteBox);
    await hiveHelper.deleteValue(key: noteModel!.id.toString());
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  void onTapAtINEditStatusEditButton() {
    Navigator.of(context).pop();
    editStatus = true;
    _inputEditStatus.add(editStatus);
  }

  void onTapAtDeleteButton() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  Future<void> onTapAtOkButton() async {
    if (titlecontroller.text.trim().isEmpty &&
        desccontroller.text.trim().isEmpty) {
      // Just close the warning, don't save empty note
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      if (noteModel == null) {
        await addNewNoteHive();
      } else {
        await editNoteHive();
      }
    }
  }

  void onPressedClosed() {
    Navigator.of(context).pop();
  }

  void getArgumentNote() {
    if (noteModel == null) {
      var args = ModalRoute.of(context)?.settings.arguments;
      if (args != null) {
        noteModel = args as NoteModel?;
        fileDataNote();
      }
    }
  }

  void fileDataNote() {
    titlecontroller.text = noteModel!.title;
    desccontroller.text = noteModel!.description;
    editStatus = false;
    _inputEditStatus.add(editStatus);
  }
}

void editNote() {}
