import 'package:flutter/material.dart';
import 'package:note_app/features/new_note/widgets/custom_app_bar_new_screen.dart';
import 'package:note_app/features/new_note/widgets/custom_new_note_screen_write.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({super.key});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarNewScreen(
        onPressedBack: () {
          Navigator.pop(context);
        },
        onPressedAtMark: () {},
      ),
      body: SafeArea(
        child: CustomNewNoteScreenWrite(),
      ),
    );
  }
}
