import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homeworks/bloc/user/user_bloc.dart';
import 'package:homeworks/bloc/user/user_event.dart';
import 'package:homeworks/bloc/user/user_state.dart';
import 'package:homeworks/data/model/status.dart';
import 'package:homeworks/data/model/user_model.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add user'),
      ),
      body: BlocConsumer<UserBloc, UserState>(
        builder: (context, state) {
          if (state.status == FormStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == FormStatus.error) {
            return Center(child: Text('ERROR ${state.statusText}'));
          }
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                TextField(
                  onChanged: (v) => firstController.text = v,
                  decoration: const InputDecoration(
                    hintText: 'Firstname',
                  ),
                ),
                TextField(
                  onChanged: (v) => lastController.text = v,
                  decoration: const InputDecoration(
                    hintText: 'Lastname',
                  ),
                ),
                TextField(
                  onChanged: (v) => ageController.text = v,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Age',
                  ),
                ),
                TextField(
                  onChanged: (v) => genderController.text = v,
                  decoration: const InputDecoration(
                    hintText: 'Gender',
                  ),
                ),
                TextField(
                  onChanged: (v) => jobController.text = v,
                  decoration: const InputDecoration(
                    hintText: 'Job',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (firstController.text.isNotEmpty &&
                        lastController.text.isNotEmpty &&
                        ageController.text.isNotEmpty &&
                        genderController.text.isNotEmpty &&
                        jobController.text.isNotEmpty) {
                      BlocProvider.of<UserBloc>(context).add(
                        AddUser(
                          newUser: UserModel(
                            firstname: firstController.text,
                            lastname: lastController.text,
                            age: ageController.text,
                            gender: genderController.text,
                            job: jobController.text,
                          ),
                        ),
                      );
                    } else {}
                  },
                  child: const Text('ADD USER'),
                ),
              ],
            ),
          );
        },
        listener: (context,state){
          if(state.status==FormStatus.done){
            Fluttertoast.showToast(
                msg: "User added",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.grey,
                textColor: Colors.white,
                fontSize: 16.0
            );
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
