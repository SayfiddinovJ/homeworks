import 'package:flutter/material.dart';
import 'package:homeworks/ui/contact/my_contacts_screen.dart';

import 'data/local/storage_repo/storage_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyContactsScreen(),
    );
  }
}
