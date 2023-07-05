import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homeworks/data/local/db/local_database.dart';
import 'package:homeworks/models/contact_model/contact_model.dart';
import 'package:homeworks/ui/contact/my_contacts_screen.dart';

import '../../utils/app_icons.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSurName = TextEditingController();
  final TextEditingController _controllerPhoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        leading: IconButton(
          onPressed: (){setState(() {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MyContactsScreen()));
          });},
          icon: SvgPicture.asset(AppIcons.arrowBack),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if(_controllerName.text.isEmpty || _controllerPhoneNumber.text.isEmpty || _controllerSurName.text.isEmpty){
                const snackBar = SnackBar(
                  content: Text('Maydonlar to\'ldirilmadi'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }else if(_controllerName.text.isNotEmpty && _controllerPhoneNumber.text.isNotEmpty && _controllerSurName.text.isNotEmpty){
                LocalDatabase.insertContact(
                  ContactModelSql(
                      phone: _controllerPhoneNumber.text,
                      name: _controllerName.text,
                      surName: _controllerSurName.text,
                  ),
                );
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MyContactsScreen()));
              }
            },
            icon: SvgPicture.asset(AppIcons.done),
          ),
        ],
        title: const Text("Add",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
                controller: _controllerName,
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
                controller: _controllerSurName,
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
                controller: _controllerPhoneNumber,
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
          ],
        ),
      ),
    );
  }
}
