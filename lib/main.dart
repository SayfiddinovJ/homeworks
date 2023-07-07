import 'package:flutter/material.dart';
import 'package:homeworks/ui/api_call_method1/home_screen1.dart';
import 'package:homeworks/ui/api_call_method2/home_screen2.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen1(),
    );
  }
}
