import 'package:flutter/material.dart';
import 'package:homeworks/data/models/country/country_model.dart';
import 'package:homeworks/data/models/country/data_model.dart';
import 'package:homeworks/data/models/universal_data.dart';
import 'package:homeworks/data/network/api_provider.dart';
import 'package:homeworks/ui/country/country_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MainCountryModel mainCountryModel;
  bool isLoading = true;

  _getData() async {
    setState(() {
      isLoading = true;
    });
    List<UniversalData> results =
        await Future.wait([ApiProvider.getCountries()]);

    if (results[0].error.isEmpty) {
      mainCountryModel = results[0].data as MainCountryModel;
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
        title: const Text('Country Screen'),
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
              physics: const BouncingScrollPhysics(),
              children: [
                ...List.generate(
                  mainCountryModel.dataModel.countryModel.length,
                  (index) {
                    CountryModel countryModel =
                        mainCountryModel.dataModel.countryModel[index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CountryDetailScreen(countryModel: countryModel),
                          ),
                        );
                      },
                      leading: Text(
                        countryModel.emoji,
                        style: const TextStyle(fontSize: 20),
                      ),
                      title: Text(
                        countryModel.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
