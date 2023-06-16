import 'package:flutter/material.dart';
class GlobalButton extends StatefulWidget {
  GlobalButton({super.key,required this.buttonText});
  String buttonText;
  @override
  State<GlobalButton> createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(width*203/307,height*49/666,),
          backgroundColor: const Color(0xFF1317DD),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23),
          )
        ),
        onPressed: (){},
        child: Text(widget.buttonText,style: const TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.08,
    ),));
  }
}
