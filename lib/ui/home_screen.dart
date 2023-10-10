import 'package:flutter/material.dart';
import 'package:homeworks/data/models/contact_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.contacts});

  final List<ContactModel> contacts;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keys')),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          debugPrint('Old index: $oldIndex');
          debugPrint('New index: $newIndex');
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final ContactModel contactModel = widget.contacts.removeAt(oldIndex);
          widget.contacts.insert(newIndex, contactModel);
          setState(() {});
        },
        children: [
          ...List.generate(
            widget.contacts.length,
            (index) {
              ContactModel contact = widget.contacts[index];
              return Dismissible(
                key: Key(contact.name),
                onDismissed: (direction) {
                  setState(() {
                    widget.contacts.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${contact.name} deleted'),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          setState(() {
                            widget.contacts.insert(index, contact);
                          });
                        },
                      ),
                    ),
                  );
                },
                background: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: const Icon(Icons.delete),
                ),
                child: ListTile(
                  key: ValueKey(index),
                  title: Text(contact.name),
                  subtitle: Text(contact.phone),
                  trailing: Text(contact.date),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
