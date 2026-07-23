import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/controller/home/home_controller.dart';
import 'package:note_app/core/resources/color_manger.dart';
import 'package:note_app/core/resources/const_value.dart';
import 'package:note_app/core/resources/routes_manger.dart';
import 'package:note_app/core/widgets/custom_bottom.dart';
import 'package:note_app/features/home/widgets/custom_floatint_action_botton.dart';
import 'package:note_app/features/new_note/widgets/custom_grid_view_notes_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController = HomeController(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          _homeController.goNewNote(RoutesName.newNoteScreenRoute);
        },
      ),
      appBar: AppBar(
        backgroundColor: ColorManger.kWhiteColor,
        automaticallyImplyLeading: false,
        actions: [
          StreamBuilder<bool>(
            stream: _homeController.outputSortOrder,
            initialData: _homeController.isAscending,
            builder: (context, snapshot) {
              return IconButton(
                onPressed: () {
                  _homeController.toggleSortOrder();
                },
                icon: Icon(
                  snapshot.data == true
                      ? Icons.arrow_upward
                      : Icons.arrow_downward,
                  color: ColorManger.kPrimaryColor,
                ),
              );
            },
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            ConstValue.appTitle,
            style: TextStyle(
              fontFamily: ConstValue.fontFamily,
              fontWeight: FontWeight.w400,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            _homeController.getAllDataNote();
          },
          child: StreamBuilder<bool>(
            stream: _homeController.outputSortOrder,
            initialData: _homeController.isAscending,
            builder: (context, snapshot) {
              return CustomGridViewNotesBody(
                isAscending: snapshot.data ?? true,
                outPutListNoteModel: _homeController.outputNote,
                onTapAtNote: _homeController.onTapAtItemNote,
              );
            }
          ),
        ),
      ),
    );
  }
}
