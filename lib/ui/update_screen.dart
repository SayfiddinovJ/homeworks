import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homeworks/bloc/user/user_bloc.dart';
import 'package:homeworks/bloc/user/user_event.dart';
import 'package:homeworks/bloc/user/user_state.dart';
import 'package:homeworks/data/model/status.dart';
import 'package:homeworks/data/model/user_model.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key, required this.userModel});

  final UserModel userModel;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  _init() {
    firstController.text = widget.userModel.firstname;
    lastController.text = widget.userModel.lastname;
    ageController.text = widget.userModel.age;
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update')),
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
                  controller: firstController,
                  decoration: const InputDecoration(
                    hintText: 'Firstname',
                  ),
                ),
                TextField(
                  controller: lastController,
                  decoration: const InputDecoration(
                    hintText: 'Lastname',
                  ),
                ),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Age',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    print(widget.userModel.id);
                    if (firstController.text.isNotEmpty &&
                        lastController.text.isNotEmpty &&
                        ageController.text.isNotEmpty) {
                      BlocProvider.of<UserBloc>(context).add(
                        UpdateUser(
                          userModel: UserModel(
                            firstname: firstController.text,
                            lastname: lastController.text,
                            age: ageController.text,
                            gender: widget.userModel.gender,
                            job: widget.userModel.job,
                          ),
                          id: widget.userModel.id!,
                        ),
                      );
                    } else {}
                  },
                  child: const Text('UPDATE USER'),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state.status == FormStatus.done) {
            Fluttertoast.showToast(
                msg: "User updated",
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
