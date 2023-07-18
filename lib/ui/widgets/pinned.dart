import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Pinned extends StatelessWidget {
  Pinned({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelect,
  });
  String icon;
  String text;
  bool isSelect;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
      margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
      height: 28.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            colors: isSelect ? [
              const Color(0xFFE1D24A),
              const Color(0xFFC69233),
            ] : [
              const Color(0xFF22222A),
              const Color(0xFF22222A),
            ]
        ),
      ),
      child: Row(
        children: [
          Image.asset(icon),
          SizedBox(width: 3.w,),
          Text(text,style: TextStyle(
            color: isSelect ? Colors.black : Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),),
        ],
      ),
    );
  }
}
