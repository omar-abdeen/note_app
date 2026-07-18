import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/features/new_note/widgets/custom_app_bar_new_screen.dart';
class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({super.key});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBarNewScreen(),
      // body: SafeArea(
      //   child: Column(
      //     children: [
      //       Text(
      //         'New Note Screen',
      //         style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
      //       ),
      //       const TextField(
      //         decoration: InputDecoration(
      //           hintText: 'Enter your note here...',
      //           border: OutlineInputBorder(),
      //         ),
      //         maxLines: null,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
