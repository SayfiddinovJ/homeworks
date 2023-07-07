import 'package:flutter/material.dart';
import 'package:homeworks/ui/add_contact/add_contact_screen.dart';
import 'package:homeworks/ui/contact/my_contacts_screen.dart';
import 'package:homeworks/ui/profile/profile_screen.dart';

class RouteNames {
  static const String contacts = "/";
  static const String addContact = "/add_contact";
  static const String contactDetails = "/contact_details";
  static const String contactProfile = "/contact_profile";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.contacts:
        return MaterialPageRoute(builder: (context) => MyContactsScreen());
      case RouteNames.addContact:
        return MaterialPageRoute(builder: (context) {
          return AddContactScreen(
            listener: settings.arguments as VoidCallback,
          );
        });
      case RouteNames.contactDetails:
        return MaterialPageRoute(builder: (context) {
          Map<String, dynamic> map = settings.arguments as Map<String, dynamic>;
          return ProfileScreen(
            deleteListener: map["deleteListener"],
            contactModelSql: map["contactModelSql"],
          );
        });
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route mavjud emas"),
            ),
          ),
        );
    }
  }
}