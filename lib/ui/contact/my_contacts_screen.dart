import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homeworks/ui/add_contact/add_contact_screen.dart';
import 'package:homeworks/ui/contact/widgets/search_view_screen.dart';
import 'package:homeworks/ui/profile/profile_screen.dart';
import 'package:homeworks/utils/app_icons.dart';

import '../../data/local/db/local_database.dart';
import '../../models/contact_model/contact_model.dart';

class MyContactsScreen extends StatefulWidget {
  const MyContactsScreen({super.key});

  @override
  State<MyContactsScreen> createState() => _MyContactsScreenState();
}

class _MyContactsScreenState extends State<MyContactsScreen> {

  List<String> options = <String>[
    'Default',
    'A-Z',
    'Z-A',
  ];
  String dropdownValue = 'Default';

  String searchText = "";

  int selectedMenu = 1;

  List<ContactModelSql> contacts = [];
  List<ContactModelSql> allContacts = [];

  _updateContacts() async {
    allContacts = await LocalDatabase.getAllContacts();
    contacts = await LocalDatabase.getAllContacts();
    setState(() {});
  }

  _getContactsByAlp(String order) async {
    contacts = await LocalDatabase.getContactsByAlphabet(order);
    setState(() {});
  }

  _getContactsByQuery(String query) async {
    contacts = await LocalDatabase.getContactsByQuery(query);
    setState(() {});
  }
  bool isSearch=false;
  @override
  void initState() {

    _updateContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        actions: [
          IconButton(onPressed: () async {
            searchText = await showSearch(
              context: context,
              delegate: ContactSearchView(
                suggestionList: allContacts.map((e) => e.name).toList(),
                surName: allContacts.map((e) => e.surName).toList(),
                id: allContacts.map((e) => e.id).toList(),
                phoneNumber: allContacts.map((e) => e.phone).toList(),
              ),
            );
            if(searchText.isNotEmpty) _getContactsByQuery(searchText);
            print("RESULT:$searchText");
            }, icon: SvgPicture.asset(AppIcons.search),),
          PopupMenuButton<int>(
            icon: SvgPicture.asset(AppIcons.more),
            onSelected: (int item) {
              setState(() {
                selectedMenu = item;
              });
              if (selectedMenu == 1) {
                LocalDatabase.deleteAll();
              } else {
                _getContactsByAlp(selectedMenu == 2 ? "ASC" : "DESC");
              }
            },
            position: PopupMenuPosition.values.last,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Delete all'),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text('Sort by A-Z'),
              ),
              const PopupMenuItem<int>(
                value: 3,
                child: Text('Sort by Z-A'),
              ),
            ],
          ),
        ],
        title: isSearch ? Row(
          children: [
            IconButton(
              onPressed: (){setState(() {
                isSearch=false;
              });},
              icon: SvgPicture.asset(AppIcons.arrowBackIos),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ) : const Text("Contacts",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),


      body: FutureBuilder<List<ContactModelSql>>(
        future: LocalDatabase.getAllContacts(),
        builder: (
          context,
          AsyncSnapshot<List<ContactModelSql>> rowData,
        ) {
          if (rowData.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(rowData.hasData==false){
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.box),
                  const SizedBox(height: 15,),
                  Text('You have no contacts yet',style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),),
                ],
              ),
            );
          }else if (rowData.hasData) {
            List<ContactModelSql> contacts = rowData.data!;
            return ListView(
              children: List.generate(
                contacts.length,
                (index) => ListTile(
                  leading: SvgPicture.asset(AppIcons.accountLogo),
                  title: Text('${contacts[index].name} ${contacts[index].surName}',style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),),
                  subtitle: Text(contacts[index].phone,style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8B8B8B),
                  ),),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppIcons.phone),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen(name: contacts[index].name, phone: contacts[index].phone, id: contacts[index].id!,surName: contacts[index].surName,)));
                  },
                ),
              ),
            );
          }
          return Center(child: Text(rowData.error.toString()));
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const AddContactScreen()));
          });
        },
        child: Center(child: SvgPicture.asset(AppIcons.plus),),
      ),
    );
  }
}
