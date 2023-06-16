import 'package:flutter/material.dart';
import 'package:homeworks/ui/login_screen/widgets/global_button.dart';
import 'package:homeworks/ui/login_screen/widgets/rich_text.dart';
import 'package:homeworks/ui/login_screen/widgets/text_field.dart';

import '../../utils/app_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: height*22/666,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*45/307),
              child: Image.asset(AppIcon.img2,height: height*186/666,width: width*226/307,),
            ),
            SizedBox(height: height*29/666,),
            const Text('Sign Up',style: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),),
            SizedBox(height: height*16/666,),
            Padding(
              padding: EdgeInsets.only(left: width*32/307,right: width*38/307,bottom: height*30/666),
              child: Column(
                children: [
                  MyTextField(text: 'First Name', icon: AppIcon.lock, isPassword: false,isName: true,),
                  SizedBox(height: height*6/666,),
                  MyTextField(text: 'Last Name', icon: AppIcon.lock, isPassword: false,isName: true,),
                  SizedBox(height: height*6/666,),
                  MyTextField(text: 'Email', icon: AppIcon.email, isPassword: false,isName: false,),
                  SizedBox(height: height*6/666,),
                  MyTextField(text: 'Password', icon: AppIcon.lock, isPassword: true,isName: false,),
                  SizedBox(height: height*6/666,),
                  MyTextField(text: 'Confirm Password', icon: AppIcon.lock, isPassword: true,isName: false,),
                  SizedBox(height: height*32/666,),
                  GlobalButton(buttonText: 'SIGNUP'),
                  SizedBox(height: height*21/666,),
                  MyRichText(first: 'Already have an account?', second: 'Login',isLogin: false,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
