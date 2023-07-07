import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:homeworks/data/local/db/local_database.dart';
import 'package:homeworks/models/contact_model/contact_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../utils/app_icons.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key, required this.listener});
  final VoidCallback listener;
  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  var maskFormatter = MaskTextInputFormatter(
      mask: '(##) ### - ## - ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSurName = TextEditingController();
  final TextEditingController _controllerPhoneNumber = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.2,
        leading: IconButton(
          onPressed: (){setState(() {
            Navigator.pop(context);
          });},
          icon: SvgPicture.asset(AppIcons.arrowBack),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              if (_controllerName.text.isNotEmpty) {
                if (_controllerPhoneNumber.text.length == 18) {
                  String phone = _controllerPhoneNumber.text.replaceAll(" ", "");
                  phone = phone.replaceAll("(", "");
                  phone = phone.replaceAll(")", "");
                  phone = phone.replaceAll("-", "");

                  ContactModelSql newContact =
                  await LocalDatabase.insertContact(
                    ContactModelSql(
                      phone: "+998$phone",
                      name: _controllerName.text,
                      surName: _controllerSurName.text.isEmpty ? '':_controllerSurName.text,
                    ),
                  );
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Contact qo\'shildi!"),
                    ),
                  );
                  if ((newContact.id != null) && (newContact.id! > 0)) {
                    if (context.mounted) {
                      widget.listener.call();
                      Navigator.pop(context);
                    }
                  } else {}
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Telefon nomer to'liq emas!"),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Ism kiriting!"),
                  ),
                );
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
                focusNode: nameFocusNode,
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
              child: TextField(
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                controller: _controllerPhoneNumber,
                focusNode: phoneFocusNode,
                inputFormatters: [maskFormatter],
                onChanged: (number) {
                  if (number.length == 18) {
                    phoneFocusNode.unfocus();
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: const Text("+998",),
                  ),
                  hintText: ' _ _  _ _ _ _ _ ',
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
