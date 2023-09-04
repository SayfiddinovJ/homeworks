import 'package:flutter/material.dart';
import 'package:homeworks/ui/home_screen.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicsScreen extends StatelessWidget {
  const MusicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final OnAudioQuery audioQuery = OnAudioQuery();
    return Scaffold(
      appBar: AppBar(
        title: const Text('All musics'),
      ),
      body: FutureBuilder<List<SongModel>>(
        future: audioQuery.querySongs(),
        builder: (context, AsyncSnapshot<List<SongModel>> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                ...List.generate(
                  snapshot.data!.length,
                  (index) {
                    var item = snapshot.data![index];
                    return ListTile(
                      title: Text(item.title),
                      onTap: () {
                        debugPrint('''
                                                
                        TITLE:  ${item.title},
                        DATA:  ${item.data},
                        ID:  ${item.id},
                        ALBUM:  ${item.album},
                        URI:  ${item.uri},
                        SIZE:  ${item.size},
                        ARTIST:  ${item.artist},
                        displayName:  ${item.displayName},
                        genre:  ${item.genre},
                        isMusic:  ${item.isMusic},
                        
                          ''');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(songModel: item),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            );
          } else {
            return const Center(
              child: Text("Loading..."),
            );
          }
        },
      ),
    );
  }
}
