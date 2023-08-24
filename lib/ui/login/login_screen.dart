import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/login/login_cubit.dart';
import 'package:homeworks/cubit/user/user_cubit.dart';
import 'package:homeworks/ui/sign_up/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (email) =>
                  context.read<UserCubit>().updateEmail(email),
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              onChanged: (password) {
                context.read<UserCubit>().updatePassword(password);
              },
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (context.watch<UserCubit>().state.email.isNotEmpty &&
                      context.watch<UserCubit>().state.password.isNotEmpty) {
                    BlocProvider.of<LoginCubit>(context).signIn(
                        context.watch<UserCubit>().state.email,
                        context.watch<UserCubit>().state.email,
                        context);
                  }
                },
                child: const Text('Log in')),
            const SizedBox(height: 20),
            const Text('or'),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
              child: const Text("SIGN UP"),
            ),
          ],
        ),
      ),
    );
  }
}
