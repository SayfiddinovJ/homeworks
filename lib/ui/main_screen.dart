import 'package:flutter/material.dart';
import 'package:homeworks/ui/screens/emoji/emojis_screen.dart';
import 'package:homeworks/ui/screens/flag_screen.dart';
import 'package:homeworks/ui/screens/snowman_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SnowmanScreen()));
            },
            title: const Text('Snowman'),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const FlagScreen()));
            },
            title: const Text('Flag'),
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const EmojisScreen()));
            },
            title: const Text('Emojis'),
          ),
        ],
      ),
    );
  }
}
