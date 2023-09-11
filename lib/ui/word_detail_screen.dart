import 'package:flutter/material.dart';
import 'package:homeworks/data/model/definitions_model.dart';

class WordDetailScreen extends StatelessWidget {
  const WordDetailScreen({
    super.key,
    required this.title,
    required this.phonetic,
    required this.definition,
  });
  final String title;
  final String phonetic;
  final DefinitionModel definition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              phonetic,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            Text('Definition: ${definition.definition}'),
            const SizedBox(height: 20),
            Text('Example: ${definition.example}'),
          ],
        ),
      ),
    );
  }
}
