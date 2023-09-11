import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeworks/data/getx/dictionary.dart';
import 'package:homeworks/data/model/dictionary_model.dart';
import 'package:homeworks/data/network/api_service.dart';
import 'package:homeworks/ui/word_detail_screen.dart';

class DictionaryScreen extends StatelessWidget {
  const DictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    DictionaryController dictionaryController =
        Get.put(DictionaryController(apiService: ApiService()));
    return Scaffold(
      appBar: AppBar(title: const Text('Dictionary')),
      body: Stack(
        children: [
          Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    onSubmitted: (v) {
                      if (v.isNotEmpty) dictionaryController.getWord(v);
                    },
                  ),
                ),
                dictionaryController.words.isEmpty
                    ? const Center(
                        child: Text('Nothing to show'),
                      )
                    : Expanded(
                        child: ListView(
                          children: [
                            ...List.generate(
                              dictionaryController.words.length,
                              (index) {
                                DictionaryModel dictionary =
                                    dictionaryController.words[index];
                                return ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => WordDetailScreen(
                                          title: dictionary.word,
                                          phonetic: dictionary.phonetic,
                                          definition: dictionary.meaning.first,
                                        ),
                                      ),
                                    );
                                  },
                                  title: Text(dictionary.word),
                                  subtitle: Text(dictionary.phonetic),
                                  trailing: IconButton(
                                    onPressed: () {
                                      player.play(
                                        UrlSource(
                                            dictionary.phonetics[index].audio),
                                      );
                                    },
                                    icon: const Icon(Icons.volume_up),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
          Align(
            child: Obx(
              () {
                return Visibility(
                    visible: dictionaryController.isLoading.value,
                    child: const CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
