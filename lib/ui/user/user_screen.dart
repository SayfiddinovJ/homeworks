import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/login/login_cubit.dart';
import 'package:homeworks/cubit/user/user_cubit.dart';
import 'package:homeworks/cubit/user/user_state.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<LoginCubit>(context).logOutUser();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          const Center(
            child: Icon(
              Icons.person_2_rounded,
              color: Colors.black,
              size: 100,
            ),
          ),
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return Text(
                state.toString(),
                style: const TextStyle(fontSize: 20),
              );
            },
          ),
        ],
      ),
    );
  }
}
