import 'package:get/get.dart';
import 'package:homeworks/data/model/dictionary_model.dart';
import 'package:homeworks/data/network/api_service.dart';

class DictionaryController extends GetxController {
  DictionaryController({required this.apiService});

  final ApiService apiService;

  RxList<DictionaryModel> words = <DictionaryModel>[].obs;
  var isLoading = false.obs;

  var isPlaying = false.obs;

  getWord(String w) async {
    isLoading.value = true;
    List<DictionaryModel> loadedWord = await apiService.getWord(w);
    isLoading.value = false;
    if (loadedWord.isNotEmpty) {
      words.value = loadedWord;
      Get.snackbar("Dictionary", "Word came");
    } else {}
  }

  play() => isPlaying.value = true;

  stop() => isPlaying.value = false;
}
