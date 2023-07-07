import 'package:flutter/material.dart';
import 'package:homeworks/ui/home_screen1.dart';
import 'package:homeworks/ui/home_screen2.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen2(),
    );
  }
}
