import 'package:flutter/material.dart';

class HomeController {
  void goNewNote(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }
}
