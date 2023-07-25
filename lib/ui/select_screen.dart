import 'package:flutter/material.dart';
import 'package:homeworks/ui/screens/eighth_screen.dart';
import 'package:homeworks/ui/screens/eleventh_screen.dart';
import 'package:homeworks/ui/screens/fifth_screen.dart';
import 'package:homeworks/ui/screens/first_screen.dart';
import 'package:homeworks/ui/screens/fourth_screen.dart';
import 'package:homeworks/ui/screens/ninth_screen.dart';
import 'package:homeworks/ui/screens/second_screen.dart';
import 'package:homeworks/ui/screens/seventh_screen.dart';
import 'package:homeworks/ui/screens/sixth_screen.dart';
import 'package:homeworks/ui/screens/tenth.dart';
import 'package:homeworks/ui/screens/third_screen.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('First'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const FirstScreen()));},
          ),
          ListTile(
            title: const Text('Second'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()));},
          ),
          ListTile(
            title: const Text('Third'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const ThirdScreen()));},
          ),
          ListTile(
            title: const Text('Fourth'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const FourthScreen()));},
          ),
          ListTile(
            title: const Text('Fifth'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const FifthScreen()));},
          ),
          ListTile(
            title: const Text('Sixth'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const SixthScreen()));},
          ),
          ListTile(
            title: const Text('Seventh'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const SeventhScreen()));},
          ),
          ListTile(
            title: const Text('Eighth'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const EighthScreen()));},
          ),
          ListTile(
            title: const Text('Ninth'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const NinthScreen()));},
          ),
          ListTile(
            title: const Text('Tenth'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const TenthScreen()));},
          ),
          ListTile(
            title: const Text('Eleventh'),
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const EleventhScreen()));},
          ),
        ],
      ),
    );
  }
}
