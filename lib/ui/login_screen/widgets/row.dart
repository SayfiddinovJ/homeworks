import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homeworks/utils/app_utils.dart';
class MyRow extends StatefulWidget {
  const MyRow({super.key});

  @override
  State<MyRow> createState() => _MyRoWState();
}

class _MyRoWState extends State<MyRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(AppIcon.google),
        SvgPicture.asset(AppIcon.apple),
        SvgPicture.asset(AppIcon.facebook),
      ],
    );
  }
}
