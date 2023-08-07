import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homeworks/data/network/api_repository.dart';
import 'package:homeworks/models/card/card_model.dart';
import 'package:homeworks/ui/api_call_method1/widgets/card_loading_shimmer.dart';
import 'package:shimmer/shimmer.dart';

import '../../data/network/api_provider.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  final BankRepository currencyRepository =
      BankRepository(apiProvider: ApiProvider());

  List<BankModel> cards = [];

  bool isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });

    cards = await currencyRepository.fetchCardsForHome();
    debugPrint("CURRENCY FETCH FINISHED:${cards.length}");
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
      ),
      body: isLoading
          ? const CardLoadingShimmer()
          : cards.isEmpty
              ? const Center(child: Text("Connection error"))
              : ListView(
                  padding: const EdgeInsets.all(10),
                  children: List.generate(
                    cards.length,
                    (index) {
                      BankModel card = cards[index];
                      String c1 =
                          '0xFF${card.colors.colorA.replaceAll('#', '')}';
                      String c2 =
                          '0xFF${card.colors.colorB.replaceAll('#', '')}';
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(colors: [
                            Color(int.parse(c1)),
                            Color(int.parse(c2)),
                          ]),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: card.iconImage,
                                  width: 50,
                                  height: 30,
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    direction: ShimmerDirection.btt,
                                    period: const Duration(milliseconds: 1000),
                                    child: Container(
                                      width: 50,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  card.bankName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 25),
                                ),
                                const Spacer(),
                                Text(
                                  card.cardType,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              '${card.moneyAmount.toString()} ${card.cardCurrency}',
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              card.cardNumber,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Text(
                                  card.expiredDate,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}
