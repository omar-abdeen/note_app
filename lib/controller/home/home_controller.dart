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

  bool isAscending = true;
  late StreamController<bool> _sortOrderController;
  late Sink<bool> _inputSortOrder;
  late Stream<bool> outputSortOrder;

  Future<void> initController() async {
    _controllerNote = StreamController();
    _inputNote = _controllerNote.sink;
    outputNote = _controllerNote.stream;

    _sortOrderController = StreamController();
    _inputSortOrder = _sortOrderController.sink;
    outputSortOrder = _sortOrderController.stream.asBroadcastStream();
    _inputSortOrder.add(isAscending);
  }

  Future<void> disposeController() async {
    _controllerNote.close();
    _inputNote.close();
    _sortOrderController.close();
    _inputSortOrder.close();
  }

  void goNewNote(String routeName) {
    Navigator.of(context).pushNamed(routeName).then((value) {
      getAllDataNote();
    });
  }

  Future<void> getAllDataNote() async {
    HiveHelper<NoteModel> hiveHelper = HiveHelper<NoteModel>(
      ConstValue.NoteBox,
    );
    Map<dynamic, NoteModel> data = await hiveHelper.getAllData();
    List<NoteModel> listData = data.values.toList();
    if (isAscending) {
      listData.sort((a, b) => a.id.compareTo(b.id));
    } else {
      listData.sort((a, b) => b.id.compareTo(a.id));
    }
    _inputNote.add(listData);
  }

  void toggleSortOrder() {
    isAscending = !isAscending;
    _inputSortOrder.add(isAscending);
    getAllDataNote();
  }

  Future<void> onTapAtItemNote(NoteModel data) async {
    Navigator.of(context)
        .pushNamed(RoutesName.newNoteScreenRoute, arguments: data)
        .then((value) async {
          await getAllDataNote();
        });
  }
}
