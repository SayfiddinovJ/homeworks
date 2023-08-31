import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:homeworks/bloc/user/user_bloc.dart';
import 'package:homeworks/bloc/user/user_event.dart';
import 'package:homeworks/bloc/user/user_state.dart';
import 'package:homeworks/data/model/status.dart';
import 'package:homeworks/data/model/user_model.dart';
import 'package:homeworks/ui/add_screen.dart';
import 'package:homeworks/ui/update_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _init() {
    BlocProvider.of<UserBloc>(context).add(GetUser());
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddScreen()));
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: BlocConsumer<UserBloc, UserState>(
        builder: (context, state) {
          if (state.status == FormStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == FormStatus.error) {
            return Center(child: Text('Error: ${state.statusText}'));
          }
          return state.users.isEmpty
              ? const Center(child: Text('EMPTY!!'))
              : ListView(
                  children: [
                    ...List.generate(
                      state.users.length,
                      (index) {
                        UserModel user = state.users[index];
                        return ListTile(
                          leading: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      UpdateScreen(userModel: user),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                          title: Text(user.firstname),
                          subtitle: Text(user.lastname),
                          trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                  title: const Text('Delete'),
                                  content: Text(
                                      'Are sure to delete ${user.firstname}?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('NO'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context
                                            .read<UserBloc>()
                                            .add(DeleteUser(id: user.id!));
                                        Fluttertoast.showToast(
                                            msg: "User deleted",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.grey,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
        },
        listener: (context, state) {},
      ),
    );
  }
}
