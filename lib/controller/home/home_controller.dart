import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/core/database/hive/hive_helper.dart';
import 'package:note_app/core/resources/const_value.dart';
import 'package:note_app/model/note_model.dart';

class HomeController {
  void goNewNote(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  Future<void> getAllDataNote() async {
    HiveHelper<NoteModel> hiveHelper = HiveHelper<NoteModel>(
      ConstValue.NoteBox,
    );
    await hiveHelper.getAllData();
  }
}
