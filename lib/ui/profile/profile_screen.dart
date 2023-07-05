import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homeworks/data/local/db/local_database.dart';

import '../../models/contact_model/contact_model.dart';
import '../../utils/app_icons.dart';
import '../contact/my_contacts_screen.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    super.key,
    required this.name,
    required this.surName,
    required this.phone,
    required this.id,
  });
  String name;
  String surName;
  int id;
  String phone;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<ContactModelSql> contacts = [];
  _updateContacts() async {
    contacts = await LocalDatabase.getAllContacts();
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
          Visibility(
            visible: isSearch==false,
            child: IconButton(
              onPressed: () {
                setState(() {
                  isSearch=true;
                });
              },
              icon: SvgPicture.asset(AppIcons.search,),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.more),
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
                  _updateSingleContact(ContactModelSql(phone: widget.phone, name: widget.name, surName: widget.surName));
                  _updateContacts();
                }, icon: SvgPicture.asset(AppIcons.edit),),
              ],
            ),
            const SizedBox(height: 20,),
            Text('${widget.name} ${widget.surName}',style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),),
            const SizedBox(height: 25,),
            Row(
              children: [
                Text(widget.phone,style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),),
                const Spacer(),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF08AE2D),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(child: SvgPicture.asset(AppIcons.call),),
                ),
                const SizedBox(width: 15,),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9AD13),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Center(child: SvgPicture.asset(AppIcons.message),),
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
        content: Text('Are you sure you want to remove ${widget.name} from your contacts?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'No'),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MyContactsScreen()));
              LocalDatabase.deleteContact(widget.id);
            },
            child: const Text('Yes'),
          ),
        ],
      );
    });
  }
  _updateSingleContact(ContactModelSql contactModelSql) {
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
                      onPressed: () async {
                        print(nameController.text);
                        print(surNameController.text);
                        print(phoneController.text);
                        await LocalDatabase.updateContact(id: widget.id, name: nameController.text, surName: surNameController.text, phone: phoneController.text);
                        Navigator.pop(context);
                        _updateContacts();
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
