import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homeworks/utils/app_utils.dart';
class MyTextField extends StatefulWidget {
  MyTextField({
    super.key,
    required this.text,
    required this.icon,
    required this.isPassword,
    required this.isName,
  });
  String icon;
  String text;
  bool isPassword;
  bool isName;
  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFEEEEEE),
            offset: Offset(0, 3),
            spreadRadius: 1,
          ),
        ]
      ),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color.fromRGBO(233, 233, 233, 0.25),width: 0),
            gapPadding: 11
          ),
          filled: true,
          fillColor: const Color.fromRGBO(233, 233, 233, 0.25),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color.fromRGBO(233, 233, 233, 0.25),width: 0),
          ),

          contentPadding: EdgeInsets.only(top: height*14/666,left: width*15/307),
          hintText: widget.text,
          hintStyle: const TextStyle(
            color: Color(0xFF131212),
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Padding(
              padding: EdgeInsets.only(top: height*12/666,left: width*12/307,right: width*8/307,bottom: height*13/666),
              child: widget.isName ? const Icon(Icons.person_outline_outlined,color: Color(0xFF1317DD),):SvgPicture.asset(widget.icon,),),
          suffixIcon: widget.isPassword ? Padding(padding: EdgeInsets.symmetric(vertical: height*15/666),child: SvgPicture.asset(AppIcon.eye),) : const Text(''),
        ),
      ),
    );
  }
}