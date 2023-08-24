import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/cubit/tabs_box/tabs_box_cubit.dart';
import 'package:homeworks/cubit/tabs_box/tabs_box_state.dart';
import 'package:homeworks/ui/power/power_screen.dart';
import 'package:homeworks/ui/user/user_screen.dart';

class TabsBox extends StatefulWidget {
  const TabsBox({super.key});

  @override
  State<TabsBox> createState() => _TabsBoxState();
}

class _TabsBoxState extends State<TabsBox> {
  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(const DegreeScreen());
    screens.add(const UserScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TabsBoxCubit, TabsBoxState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.index,
            children: screens,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        onTap: (index) {
          context.read<TabsBoxCubit>().updateIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.numbers),
            label: 'Power',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
