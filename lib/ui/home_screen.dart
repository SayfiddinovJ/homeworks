import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/student_cubit.dart';
import 'package:homeworks/cubit/student_state.dart';
import 'package:homeworks/ui/add_screen.dart';
import 'package:sqlflite_package/model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Students')),
      body: BlocBuilder<StudentCubit, StudentState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetState) {
            return state.studentModel.isEmpty
                ? const Center(child: Text('You have no students yet'))
                : ListView(
                  physics: const BouncingScrollPhysics(),
                    children: [
                      ...List.generate(
                        state.studentModel.length,
                        (index) {
                          StudentModel student = state.studentModel[index];
                          return  ListTile(
                            title: Text('${student.name} ${student.lastname}'),
                            subtitle: Text(student.age),
                            trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content:
                                          const Text('Are you sure to delete'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('No'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            context
                                                .read<StudentCubit>()
                                                .delete(student.id!);
                                          },
                                          child: const Text('Yes'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.delete),),
                          );
                        },
                      )
                    ],
                  );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
