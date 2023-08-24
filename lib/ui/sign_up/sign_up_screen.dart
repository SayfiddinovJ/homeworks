import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/login/login_cubit.dart';
import 'package:homeworks/cubit/user/user_cubit.dart';
import 'package:homeworks/ui/login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.name,
              onChanged: (username) =>
                  context.read<UserCubit>().updateUsername(username),
              decoration: const InputDecoration(hintText: 'Username'),
            ),
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
                    context.watch<UserCubit>().state.password.isNotEmpty &&
                    context.watch<UserCubit>().state.username.isNotEmpty) {
                  BlocProvider.of<LoginCubit>(context).signUp(
                      context.watch<UserCubit>().state.email,
                      context.watch<UserCubit>().state.password,
                      context.watch<UserCubit>().state.username,
                      context);
                }
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            const Text('or'),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text('Log in'))
          ],
        ),
      ),
    );
  }
}
