import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_icons.dart';

class ContactSearchView extends SearchDelegate {
  ContactSearchView({
    required this.suggestionList,
    required this.surName,
    required this.id,
    required this.phoneNumber,
  });
  List<String> surName;
  List<int?> id;
  List<String> phoneNumber;

  final List<String> suggestionList;

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      onPressed: () {
        query = '';
      },
      icon: const Icon(Icons.close),
    )
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      close(context, query);
    },
  );

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: const TextStyle(
          fontSize: 64,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = suggestionList.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView(
      children: List.generate(
        suggestions.length,
            (index) => ListTile(
              leading: SvgPicture.asset(AppIcons.accountLogo),
              title: Text(suggestions[index],style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),),
              trailing: IconButton(
                onPressed: () async{
                  await FlutterPhoneDirectCaller.callNumber(phoneNumber[index]);
                },
                icon: SvgPicture.asset(AppIcons.phone),
              ),
              onTap: (){
                query = suggestions[index];
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfileScreen(name: suggestions[index], phone: phoneNumber[index], id: id[index]!,surName: surName[index],),),);
              },
            ),
      ),
    );
  }
}