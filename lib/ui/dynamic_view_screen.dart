import 'package:flutter/material.dart';
import 'package:homeworks/data/models/dynamic_view_model.dart';
import 'package:homeworks/data/models/main_model.dart';
import 'package:homeworks/data/models/universal_data.dart';
import 'package:homeworks/provider/api_provider.dart';

class DynamicViewScreen extends StatefulWidget {
  const DynamicViewScreen({Key? key}) : super(key: key);

  @override
  State<DynamicViewScreen> createState() => _DynamicViewScreenState();
}

class _DynamicViewScreenState extends State<DynamicViewScreen> {
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
              children: [
                ...List.generate(
                  mainModel.dynamicView.length,
                  (index) => getType(mainModel.dynamicView[index]),
                ),
              ],
            ),
    );
  }

  Widget getType(DynamicViewModel dynamicViewModel) {
    int color = int.parse('0x${dynamicViewModel.color.replaceAll('#', '')}');
    switch (dynamicViewModel.type) {
      case 'container':
        return Container(
          height: dynamicViewModel.height.toDouble(),
          width: dynamicViewModel.width.toDouble(),
          color: Color(color),
          child: Center(
            child: Text(dynamicViewModel.title),
          ),
        );
      case 'column':
        return Column(
          children: [
            Text(
              dynamicViewModel.title,
              style: TextStyle(
                color: Color(color),
              ),
            ),
          ],
        );
      case 'row':
        return Row(
          children: [
            Text(
              dynamicViewModel.title,
              style: TextStyle(
                color: Color(color),
              ),
            ),
          ],
        );
      case 'sizedbox':
        return SizedBox(
          height: dynamicViewModel.height.toDouble(),
          width: dynamicViewModel.width.toDouble(),
          child: Text(
            dynamicViewModel.title,
            style: TextStyle(
              color: Color(color),
            ),
          ),
        );
      default:
        return const Text('None');
    }
  }
}
