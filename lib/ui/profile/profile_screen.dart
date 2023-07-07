import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homeworks/data/local/db/local_database.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/contact_model/contact_model.dart';
import '../../utils/app_icons.dart';
import '../contact/widgets/search_view_screen.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.contactModelSql,
    required this.deleteListener
  });
  final ContactModelSql contactModelSql;
  final VoidCallback deleteListener;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


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
    setState(() {widget.deleteListener.call();});
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){setState(() {
            Navigator.pop(context);
          });},
          icon: SvgPicture.asset(AppIcons.arrowBack),
        ),
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
            debugPrint("RESULT:$searchText");
          }, icon: SvgPicture.asset(AppIcons.search),),
          PopupMenuButton<int>(
            icon: SvgPicture.asset(AppIcons.more),
            onSelected: (int item) {
              setState(() {
                selectedMenu = item;
              });
              if (selectedMenu == 1) {
                _showDialog();
                _updateContacts();
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
        ) : const Text("Profile",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 42,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(width: 110,),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: SvgPicture.asset(AppIcons.accountLogo,fit: BoxFit.cover,),),
                const Spacer(),
                IconButton(onPressed: (){
                  _showDialog();
                  }, icon: SvgPicture.asset(AppIcons.delete),),
                IconButton(onPressed: (){
                  _updateSingleContact(ContactModelSql(phone: widget.contactModelSql.phone, name: widget.contactModelSql.name, surName: widget.contactModelSql.surName),(){_updateContacts();});
                  _updateContacts();
                }, icon: SvgPicture.asset(AppIcons.edit),),
              ],
            ),
            const SizedBox(height: 20,),
            Text('${widget.contactModelSql.name} ${widget.contactModelSql.surName}',style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),),
            const SizedBox(height: 25,),
            Row(
              children: [
                Text(widget.contactModelSql.phone,style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),),
                const Spacer(),
                GestureDetector(
                  onTap: ()async{
                    await FlutterPhoneDirectCaller.callNumber(widget.contactModelSql.phone);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF08AE2D),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(child: SvgPicture.asset(AppIcons.call),),
                  ),
                ),
                const SizedBox(width: 15,),
                GestureDetector(
                  onTap: ()async{
                    await launchUrl(Uri.parse("sms:${widget.contactModelSql.phone}?body="));
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9AD13),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(child: SvgPicture.asset(AppIcons.message),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showDialog(){
    showDialog(context: context, builder: (context){
      return  AlertDialog(
        title: const Text('Delete contact'),
        content: Text('Are you sure you want to remove ${widget.contactModelSql.name} ${widget.contactModelSql.surName} from your contacts?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'No'),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: (){
              Navigator.pop(context);
              Navigator.of(context).pop();
              LocalDatabase.deleteContact(widget.contactModelSql.id!);
              widget.deleteListener.call();
            },
            child: const Text('Yes'),
          ),
        ],
      );
    });
  }


  _updateSingleContact(ContactModelSql contactModelSql, VoidCallback deleteListener) {
    TextEditingController nameController =
    TextEditingController(text: contactModelSql.name);
    TextEditingController surNameController =
    TextEditingController(text: contactModelSql.surName);
    TextEditingController phoneController =
    TextEditingController(text: contactModelSql.phone);

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  const SizedBox(height: 20,),
                  const Text('Name',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),),
                  const SizedBox(height: 5,),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9E9E9E),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFF454545),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFF454545),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFF454545),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text('Surname',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),),
                  const SizedBox(height: 5,),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: surNameController,
                      decoration: InputDecoration(
                        hintText: 'Surname',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9E9E9E),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFF454545),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFF454545),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFF454545),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text('Phone number',style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),),
                  const SizedBox(height: 5,),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: '+998 __ ___ __ __',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9E9E9E),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFF454545),
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFF454545),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide: const BorderSide(
                            width: 1,
                            color: Color(0xFF454545),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        a()async{
                          debugPrint(nameController.text);
                          debugPrint(surNameController.text);
                          debugPrint(phoneController.text);
                          await LocalDatabase.updateContact(id: widget.contactModelSql.id!, name: nameController.text, surName: surNameController.text, phone: phoneController.text);
                        }
                        a();
                        Navigator.pop(context);
                        deleteListener.call();
                      },
                      child: const Text('Update'),
                    ),
                  ),
                ],
              ),
            ),
          );
      });
  }
}
