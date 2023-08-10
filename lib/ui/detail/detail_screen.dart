import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homeworks/data/models/car/car_model.dart';
import 'package:homeworks/data/models/universal_data.dart';
import 'package:homeworks/data/network/api_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.id});

  final int id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isLoading = true;
  late CarModel carModel;

  getCar() async {
    setState(() {
      isLoading = true;
    });
    List<UniversalData> results =
        await Future.wait([ApiProvider.getCar(widget.id)]);

    if (results[0].error.isEmpty) {
      carModel = results[0].data as CarModel;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        actions: [
          IconButton(
            onPressed: () {
              getCar();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: 170,
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider(
                    items: [
                      ...List.generate(
                        carModel.carPics.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              imageUrl: carModel.carPics[index],
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                    options: CarouselOptions(autoPlay: true),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        height: 100,
                        width: 150,
                        imageUrl: carModel.logo,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          size: 100,
                        ),
                      ),
                      Text(
                        'Name: ${carModel.carModel}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Price: ${carModel.averagePrice} \$',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Established year: ${carModel.establishedYear}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Description: ${carModel.description}',
                        style: const TextStyle(fontSize: 18),
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
