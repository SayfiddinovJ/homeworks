import 'package:flutter/material.dart';
import 'package:homeworks/ui/login_screen/login_screen.dart';
import 'package:homeworks/ui/sign_up_screen/sing_up_screen.dart';
class MyRichText extends StatelessWidget {
  MyRichText({
    super.key,
    required this.first,
    required this.second,
    required this.isLogin,
  });
  String first;
  String second;
  bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(first,style: const TextStyle(
            color: Color(0xFF131212),
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
          ),
          TextButton(onPressed: (){_navigator(context, isLogin);}, child: Text(second,style: const TextStyle(
            color: Color(0xFF1317DD),
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
          ),)
        ]
    );
  }
  _navigator(BuildContext context,bool isLogin){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return isLogin ? const SignUpScreen() : const LoginScreen();
    },),);
  }
}
