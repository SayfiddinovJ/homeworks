import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key, required this.first, required this.second});

  final String first;
  final String second;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Text(
            first,
            style: const TextStyle(color: Colors.grey, fontSize: 10),
          ),
          const Spacer(),
          Text(
            second,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
