import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/student_cubit.dart';
import 'package:homeworks/cubit/student_state.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController lastnameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Add')),
      body: BlocConsumer<StudentCubit, StudentState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: lastnameController,
                  decoration: const InputDecoration(hintText: 'Lastname'),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Age'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        lastnameController.text.isNotEmpty &&
                        ageController.text.isNotEmpty) {
                      context.read<StudentCubit>().add(nameController.text,
                          lastnameController.text, ageController.text);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Fields are not filled'),
                        ),
                      );
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is AddSuccessState) {
            debugPrint('listener pop');
            context.read<StudentCubit>().get();
            Navigator.pop(context);
          }
          if (state is LoadingState) {
            const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
