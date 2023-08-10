import 'package:flutter/material.dart';
import 'package:homeworks/data/models/country/country_model.dart';

class CountryDetailScreen extends StatelessWidget {
  const CountryDetailScreen({super.key, required this.countryModel});

  final CountryModel countryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(countryModel.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              countryModel.emoji,
              style: const TextStyle(fontSize: 50),
            ),
            Text(
              'Country code: ${countryModel.code}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Capital: ${countryModel.capital}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Continent: ${countryModel.continent.name}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Currency: ${countryModel.currency}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Phone: ${countryModel.phone}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
