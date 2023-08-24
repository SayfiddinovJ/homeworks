import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/degree/degree_cubit.dart';
import 'package:homeworks/cubit/login/login.dart';
import 'package:homeworks/cubit/tabs_box/tabs_box_cubit.dart';
import 'package:homeworks/cubit/user/user_cubit.dart';
import 'package:homeworks/ui/tabs_box.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DegreeCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (_) => LoginCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (_) => UserCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (_) => TabsBoxCubit(),
          lazy: true,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabsBox(),
    );
  }
}