import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homeworks/ui/login/login_screen.dart';
import 'package:homeworks/ui/tabs_box.dart';
import 'package:homeworks/utils/loading.dart';
import 'package:homeworks/utils/show_error.dart';

class AuthService {
  User? user = FirebaseAuth.instance.currentUser;

  static Stream<User?> listenAuthState() =>
      FirebaseAuth.instance.authStateChanges();

  static Future<void> login(BuildContext context) async {
    try {
      showLoading(context: context);

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'email',
        password: 'password',
      );
      if (context.mounted) {
        hideLoading(dialogContext: context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TabsBox(),
          ),
        );
        showConfirmMessage(
            message: "logged in successfully! ", context: context);
      }
    } on FirebaseAuthException catch (e) {
      showErrorMessage(message: e.code.toString(), context: context);
    } catch (error) {
      showErrorMessage(message: error.toString(), context: context);
    }
  }

  static Future<void> logOut(BuildContext context) async {
    try {
      showLoading(context: context);

      await FirebaseAuth.instance.signOut();

      if (context.mounted) {
        hideLoading(dialogContext: context);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      showErrorMessage(message: e.code.toString(), context: context);
    } catch (error) {
      showErrorMessage(message: error.toString(), context: context);
    }
  }

  static Future<void> createUser(
      BuildContext context, String email, String password) async {
    try {
      showLoading(context: context);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) {
        showConfirmMessage(
            message: "User created successfully! ", context: context);
      }
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const TabsBox(),
            ),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      showErrorMessage(message: e.code.toString(), context: context);
      if (e.code == 'email-already-in-use') {
        showErrorMessage(
            message: 'The account already exists for that email.',
            context: context);
      }
    } catch (error) {
      showErrorMessage(message: error.toString(), context: context);
    }
  }
}
