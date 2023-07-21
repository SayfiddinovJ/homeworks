import 'package:flutter/material.dart';
import 'package:homeworks/data/models/google_search_model.dart';
import 'package:homeworks/data/models/organic_model.dart';
import 'package:homeworks/data/models/universal_data.dart';
import 'package:homeworks/data/network/api_provider.dart';
import 'package:homeworks/ui/detail/detail_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController queryController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  int selectedMenu = 0;
  int currentPage = 1;
  int countOfPage = 5;
  String queryText = "";
  bool isLoading = false;

  List<OrganicModel> organicModels = [];

  _fetchResult() async {
    setState(() {
      isLoading = true;
    });
    UniversalData universalData = await ApiProvider.searchFromGoogle(
      query: queryText,
      page: currentPage,
      count: countOfPage,
      gl: 'en'
    );

    setState(() {
      isLoading = false;
    });

    if (universalData.error.isEmpty) {
      GoogleSearchModel googleSearchModel =
      universalData.data as GoogleSearchModel;
      organicModels.addAll(googleSearchModel.organicModels);
      setState(() {});
    }
    currentPage++;
  }
  _getNews() async {
    setState(() {
      isLoading = true;
    });
    UniversalData universalData = await ApiProvider.searchFromGoogle(
        query: 'News',
        page: currentPage,
        count: countOfPage+5,
        gl: 'en'
    );

    setState(() {
      isLoading = false;
    });

    if (universalData.error.isEmpty) {
      GoogleSearchModel googleSearchModel =
      universalData.data as GoogleSearchModel;
      organicModels.addAll(googleSearchModel.organicModels);
      setState(() {});
    }
    currentPage++;
  }
  @override
  void initState() {
    _getNews();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _fetchResult();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google search"),
        actions: [
          Center(
            child: PopupMenuButton<int>(
              initialValue: 3,
              onSelected: (int item) {
                setState(() {
                  selectedMenu = item;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text('Item 0'),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text('Item 1'),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text('Item 2'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
            child: TextField(
              onChanged: (v) {
                queryText = v;
              },
              onSubmitted: (v) {
                setState(() {
                  organicModels = [];
                  currentPage = 1;
                });
                if(queryText.isEmpty){
                  _getNews();
                }else{
                  _fetchResult();
                }
              },
              controller: queryController,
              decoration: InputDecoration(
                hintText: 'Search...',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),),),
            ),
          ),
          Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 10,top: 10),
                    child: Text(queryText.isEmpty ? 'News' : queryText),
                  ),
                  ...List.generate(organicModels.length, (index) {
                    OrganicModel organicModel = organicModels[index];
                    return Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 6),
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(1, 3),
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(16)),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(organicModel.title,style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),),
                          const SizedBox(height: 5,),
                          Text(organicModel.snippet,maxLines: 2,overflow: TextOverflow.ellipsis,),
                          const SizedBox(height: 5,),
                          TextButton(
                            onPressed: ()async{
                              Uri url = Uri.parse(organicModel.link);
                              await launchUrl(url);
                            },
                            child: Text(organicModel.link,style: const TextStyle(
                                color: Colors.blue
                            ),maxLines: 1,),
                          ),
                          Row(
                            children: [
                              Text(organicModel.date),
                              const Spacer(),
                              TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(appBarTitle: queryText.isEmpty ? 'News' : queryText, organicModel: organicModel)));
                              }, child: const Text('more'),),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                  Visibility(
                    visible: isLoading,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20,),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}