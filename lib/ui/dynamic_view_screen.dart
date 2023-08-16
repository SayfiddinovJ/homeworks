import 'package:flutter/material.dart';
import 'package:homeworks/data/models/dynamic_view_model.dart';
import 'package:homeworks/data/models/main_model.dart';
import 'package:homeworks/data/models/universal_data.dart';
import 'package:homeworks/provider/api_provider.dart';
import 'package:homeworks/utils/helper.dart';

class DynamicViewScreen extends StatefulWidget {
  const DynamicViewScreen({Key? key}) : super(key: key);

  @override
  State<DynamicViewScreen> createState() => _DynamicViewScreenState();
}

class _DynamicViewScreenState extends State<DynamicViewScreen> {
  List<DynamicViewModel> common = [];
  List<DynamicViewModel> grouped = [];
  late MainModel mainModel;
  bool isLoading = true;

  _getInitialData() async {
    setState(() {
      isLoading = true;
    });
    List<UniversalData> results =
        await Future.wait([ApiProvider.getProducts()]);

    if (results[0].error.isEmpty) {
      mainModel = results[0].data as MainModel;
      for (var element in mainModel.dynamicView) {
        debugPrint(element.group);
        if (element.group == 'COMMON') {
          common.add(element);
        } else if (element.group == 'GROUPED') {
          grouped.add(element);
        }
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Views'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: const EdgeInsets.all(15),
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.symmetric(vertical: 5),child: Text('COMMON',style: TextStyle(fontSize: 20),),),
                      ...List.generate(
                          common.length, (index) => getWidget(common[index]))
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.symmetric(vertical: 5),child: Text('GROUPED',style: TextStyle(fontSize: 20),),),
                      ...List.generate(
                          grouped.length, (index) => getWidget(grouped[index]))
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget getWidget(DynamicViewModel dynamicViewModel) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: dynamicViewModel.height.toDouble(),
      width: dynamicViewModel.width.toDouble(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Helper.hexToColor(dynamicViewModel.color),
      ),
      child: Center(
        child: Text(
          '${dynamicViewModel.title} ${dynamicViewModel.type}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}