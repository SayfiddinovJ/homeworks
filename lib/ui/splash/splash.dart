import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homeworks/firebase_service/auth_service.dart';
import 'package:homeworks/ui/login/login_screen.dart';
import 'package:homeworks/ui/tabs_box.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: AuthService.listenAuthState(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.data == null) {
            return const LoginScreen();
          } else {
            return const TabsBox();
          }
        },
      ),
    );
  }
}
