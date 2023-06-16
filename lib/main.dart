import 'package:flutter/material.dart';
import 'package:homeworks/ui/login_screen/login_screen.dart';
import 'package:homeworks/ui/sign_up_screen/sing_up_screen.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
