import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeworks/ui/widgets/my_text.dart';

class MyCheck extends StatelessWidget {
  const MyCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: CupertinoColors.systemGreen,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'PAYNET',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const Text(
            'QULAY PUL!',
            style: TextStyle(fontSize: 10),
          ),
          const MyText(
              first: 'Karta orqali to\'landi', second: '**** **** **** 4358'),
          const MyText(first: 'Terminal', second: '19110A4V'),
          const MyText(first: 'Xizmat', second: 'OOO AVTOMATLASHTIRILGAN TR'),
          const MyText(first: 'To\'lov vaqti', second: '10.10.2023 20:48'),
          const MyText(first: 'To\'lov miqdori', second: '1 400 so\'m'),
          const MyText(first: 'Holati', second: 'Muvaffaqiyatli'),
        ],
      ),
    );
  }
}
