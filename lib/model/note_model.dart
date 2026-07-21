import 'dart:io';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String dateTime;
  @HiveField(4)
  final bool done;

  const NoteModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.done,
  });

  @override
  String toString() {
    return 'NoteModel{id: $id, title: $title, description: $description, dateTime: $dateTime, done: $done}';
  }
}
