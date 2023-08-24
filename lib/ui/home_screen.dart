import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/api_cubit.dart';
import 'package:homeworks/cubit/api_state.dart';
import 'package:homeworks/data/models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocConsumer<ApiCubit, ApiState>(
        builder: (context, state) {
          if (state is ApiLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            children: [
              ...List.generate(
                context.read<ApiCubit>().userModel.length,
                (index) {
                  UserModel user = context.read<ApiCubit>().userModel[index];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        user.avatarUrl,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    title: Text(user.name),
                    subtitle: Text(user.username),
                    trailing: Text(user.state),
                  );
                },
              ),
            ],
          );
        },
        listener: (context, state) {
          if (state is ApiLoadingState) {
            const Center(child: CircularProgressIndicator());
          }
          if (state is ApiErrorState) {
            Center(child: Text(state.error));
          }
        },
      ),
    );
  }
}
