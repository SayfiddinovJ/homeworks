import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homeworks/data/models/company/company_model.dart';
import 'package:homeworks/data/models/company/main_data_model.dart';
import 'package:homeworks/data/models/universal_data.dart';
import 'package:homeworks/data/network/api_provider.dart';
import 'package:homeworks/ui/detail/detail_screen.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  late MainDataModel mainDataModel;
  bool isLoading = true;

  _getData() async {
    setState(() {
      isLoading = true;
    });
    List<UniversalData> results =
        await Future.wait([ApiProvider.getCompanies()]);

    if (results[0].error.isEmpty) {
      mainDataModel = results[0].data as MainDataModel;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Screen'),
        actions: [
          IconButton(
            onPressed: () {
              _getData();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                ...List.generate(
                  mainDataModel.companyModel.length,
                  (index) {
                    CompanyModel companyModel =
                        mainDataModel.companyModel[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(id: companyModel.id)));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              height: 50,
                              width: 100,
                              imageUrl: companyModel.logo,
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                                size: 50,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(companyModel.carModel,style: const TextStyle(fontSize: 20),),
                                Text(companyModel.averagePrice.toString(),style: const TextStyle(fontSize: 20),),
                              ],
                            ),
                            const Spacer(),
                            Text(companyModel.establishedYear.toString(),style: const TextStyle(fontSize: 20),),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
