import 'package:flutter/material.dart';
import 'package:homeworks/data/models/organic_model.dart';
import 'package:url_launcher/url_launcher.dart';
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key,required this.appBarTitle,required this.organicModel});
  final String appBarTitle;
  final OrganicModel organicModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(organicModel.title,style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700
            ),),
            const SizedBox(height: 10,),
            Text(organicModel.snippet,style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500
            ),),
            const SizedBox(height: 10,),
            TextButton(
              onPressed: ()async{
                Uri url = Uri.parse(organicModel.link);
                await launchUrl(url);
              },
              child: Text(organicModel.link,maxLines: 1,overflow: TextOverflow.ellipsis,style: const TextStyle(
                color: Colors.blue
              ),),
            ),
            const Spacer(),
            Text(organicModel.date,),
          ],
        ),
      ),
    );
  }
}
