import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/app/my_app.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}
