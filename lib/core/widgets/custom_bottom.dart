import 'package:flutter/material.dart';
import 'package:note_app/core/resources/color_manger.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    required this.onTap,
    required this.icon,
    required this.alignment,
    required this.offset,
    required this.blurRadius,
    // ignore: non_constant_identifier_names
    required this.Width,
    // ignore: non_constant_identifier_names
    required this.Height,
  });

  final GestureTapCallback onTap;
  final Widget icon;
  final AlignmentGeometry alignment;
  final Offset offset;
  final double blurRadius;

  // ignore: non_constant_identifier_names
  final double Width;

  // ignore: non_constant_identifier_names
  final double Height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          width: Width,
          height: Height,
          decoration: BoxDecoration(
            color: ColorManger.kPrimaryColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0x66000000),
                offset: offset,
                blurRadius: blurRadius,
              ),
            ],
          ),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
