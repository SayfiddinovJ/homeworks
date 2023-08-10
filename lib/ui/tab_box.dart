import 'package:flutter/material.dart';
import 'package:homeworks/ui/companies/company_screen.dart';
import 'package:homeworks/ui/home/home_screen.dart';

class TabsBox extends StatefulWidget {
  const TabsBox({Key? key}) : super(key: key);

  @override
  State<TabsBox> createState() => _TabsBoxState();
}

class _TabsBoxState extends State<TabsBox> {
  int currentTabIndex = 0;

  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(const HomeScreen());
    screens.add(const CompanyScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentTabIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                spreadRadius: 20,
                blurRadius: 25,
                color: Colors.grey.shade200,
              ),
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            elevation: 20,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: false,
            iconSize: 36,
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            onTap: (index) {
              setState(() {
                currentTabIndex = index;
              });
            },
            currentIndex: currentTabIndex,
            items: [
              getBottomNavItem(
                icon: Icons.home,
                label: "Countries",
              ),
              getBottomNavItem(
                icon: Icons.car_crash,
                label: "Companies",
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem getBottomNavItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.red,
      activeIcon: Icon(
        icon,
        color: Colors.green,
      ),
      icon: Icon(icon),
      label: label,
    );
  }
}