import 'package:flutter/material.dart';
import 'package:homeworks/data/form_status.dart';
import 'package:homeworks/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              switch (userProvider.status) {
                case FormStatus.pure:
                  return const Center(
                      child: Text("No data yet, empty status"));
                case FormStatus.failure:
                  return Center(child: Text(userProvider.errorText));
                case FormStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case FormStatus.success:
                  return Expanded(
                    child: ListView(
                      children: [
                        ...List.generate(userProvider.userModel!.length,
                            (index) {
                          return ListTile(
                            title: Text(userProvider.userModel![index].title),
                            subtitle: Text(userProvider.userModel![index].userId
                                .toString()),
                            trailing: Text(
                                userProvider.userModel![index].id.toString()),
                          );
                        })
                      ],
                    ),
                  );
              }
            },
          ),
          TextButton(
              onPressed: () {
                UserProvider userProvider =
                    Provider.of<UserProvider>(context, listen: false);
                userProvider.fetchUserData();
              },
              child: const Text("Get Data"))
        ],
      ),
    );
  }
}
