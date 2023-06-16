import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homeworks/ui/login_screen/widgets/global_button.dart';
import 'package:homeworks/ui/login_screen/widgets/rich_text.dart';
import 'package:homeworks/ui/login_screen/widgets/row.dart';
import 'package:homeworks/ui/login_screen/widgets/text_field.dart';
import 'package:homeworks/utils/app_utils.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: height*30/666),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width*45/307),
                child: Image.asset(AppIcon.img,height: height*225/666,width: width*218/307,),
              ),
              SizedBox(height: height*16/666,),
              const Center(child: Text('LOGIN',style: TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),),),
              Padding(
                padding: EdgeInsets.only(top: height*16/666,left: width*32/307,right: width*38/307),
                child: Column(
                  children: [
                    MyTextField(icon: AppIcon.email,text: 'Email',isPassword: false,isName: false,),
                    SizedBox(height: height*6/666,),
                    MyTextField(icon: AppIcon.lock,text: 'Password',isPassword: true,isName: false),
                    SizedBox(height: height*14/666,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width*9/307),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcon.switchIcon),
                          SizedBox(width: width*6/307,),
                          getText('Remember Me'),
                          const Spacer(),
                          getText('Forgot Password?'),
                        ],
                      ),
                    ),
                    SizedBox(height: height*28/666,),
                    GlobalButton(buttonText: 'LOGIN'),
                    SizedBox(height: height*13/666,),
                    const Text('OR',style: TextStyle(
                      color: Color.fromRGBO(19, 18, 18, 0.8),
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),),
                    SizedBox(height: height*6/666,),
                    getText('Log in with'),
                    SizedBox(height: height*30/666,),
                    const MyRow(),
                    SizedBox(height: height*19/666,),
                    MyRichText(first: 'Don’t have an account?', second: 'Register now',isLogin: true,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  getText(String text){
    return Text(text,style: const  TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 11,
      color: Color.fromRGBO(19, 18, 18, 0.8),
    ),);
  }
  
  
}
