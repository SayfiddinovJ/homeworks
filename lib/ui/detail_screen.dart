import 'package:flutter/material.dart';
import 'package:homeworks/data/graphql/api_service.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.ship});

  final ShipsModel ship;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ship.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  ship.image,
                  fit: BoxFit.fill,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  errorBuilder: (e1, e2, e3) => const Icon(
                    Icons.error,
                    size: 50,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Model: ${ship.model}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Status: ${ship.status}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Year Built: ${ship.yearBuilt}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ...List.generate(
              ship.roles.length,
              (index) => Text(
                'Model: ${ship.roles[index]}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
