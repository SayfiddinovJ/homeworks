import 'package:flutter/material.dart';
import 'package:homeworks/data/network/api_repository.dart';
import 'package:homeworks/models/currency_model.dart';

import '../data/network/api_provider.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  final BankRepository currencyRepository =
  BankRepository(apiProvider: ApiProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currencies Screen"),
      ),
      body: FutureBuilder<List<BankModel>>(
        future: currencyRepository.fetchCurrencies(),
        builder: (
            BuildContext context,
            AsyncSnapshot<List<BankModel>> snapshot,
            ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            List<BankModel> cards = snapshot.data!;
            return cards.isNotEmpty
                ? ListView(
              padding: const EdgeInsets.all(10),
              children: List.generate(
                cards.length,
                    (index) {
                  BankModel card = cards[index];
                  String c1 = '0xFF${card.colors.colorA.replaceAll('#', '')}';
                  String c2 = '0xFF${card.colors.colorB.replaceAll('#', '')}';
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: [
                            Color(int.parse(c1)),
                            Color(int.parse(c2)),
                          ]
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network(card.iconImage),
                            ),
                            const SizedBox(width: 5,),
                            Text(card.bankName,style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25
                            ),),
                            const Spacer(),
                            Text(card.cardType,style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                            ),),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Text('${card.moneyAmount.toString()} ${card.cardCurrency}',style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700
                        ),),
                        const SizedBox(height: 5,),
                        Text(card.cardNumber,style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            const Spacer(),
                            Text(card.expiredDate,style: const TextStyle(
                                fontWeight: FontWeight.w500
                            ),),
                          ],
                        ),
                        const SizedBox(height: 5,),
                      ],
                    ),
                  );
                },
              ),
            )
                : const Center(child: Text("Xatolik sodir bo'ldi"));
          }
          return Center(child: Text("Error:${snapshot.error}"));
        },
      ),
    );
  }
}
