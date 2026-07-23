import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/core/database/hive/hive_helper.dart';
import 'package:note_app/core/resources/const_value.dart';
import 'package:note_app/core/resources/routes_manger.dart';
import 'package:note_app/model/note_model.dart';

class HomeController {
  BuildContext context;

  HomeController(this.context) {
    start();
  }

  Future<void> start() async {
    initController();
    getAllDataNote();
  }

  late StreamController<List<NoteModel>> _controllerNote;
  late Sink<List<NoteModel>> _inputNote;
  late Stream<List<NoteModel>> outputNote;

  Future<void> initController() async {
    _controllerNote = StreamController();
    _inputNote = _controllerNote.sink;
    outputNote = _controllerNote.stream;
  }

  Future<void> disposeController() async {
    _controllerNote.close();
    _inputNote.close();
    // await Hive.close();
    // await Hive.deleteBoxFromDisk(ConstValue.NoteBox);
    // await Hive.deleteBoxFromDisk(ConstValue.IDNoteBox);
  }

  void goNewNote(String routeName) {
    Navigator.of(context).pushNamed(routeName).then((value) {
      getAllDataNote();
    });
  }

  Future<void> getAllDataNote() async {
    _inputNote.add([]);
    HiveHelper<NoteModel> hiveHelper = HiveHelper<NoteModel>(
      ConstValue.NoteBox,
    );
    Map<dynamic, NoteModel> data = await hiveHelper.getAllData();
    List<NoteModel> listData = data.values.toList();
    listData.sort((a, b) => a.id.compareTo(b.id));
    _inputNote.add(listData);
  }

  Future<void> onTapAtItemNote(NoteModel data) async {
    Navigator.of(
      context,
    ).pushNamed(RoutesName.newNoteScreenRoute, arguments: data).then((value) async{
     await getAllDataNote();
    });
  }
}
