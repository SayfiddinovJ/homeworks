import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/bloc/player/player_event.dart';
import 'package:homeworks/bloc/player/player_state.dart';
import 'package:marquee/marquee.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../bloc/player/player_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.songModel});

  final SongModel songModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Duration duration = Duration.zero;
  Duration currentDuration = Duration.zero;
  final player = AudioPlayer();
  bool isPlaying = false;

  _init() async {
    player.onDurationChanged.listen((Duration d) {
      setState(() {
        duration = d;
      });
    });

    player.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        duration = Duration.zero;
        currentDuration = Duration.zero;
      });
      debugPrint("SONG COMPLETED");
    });

    player.onPositionChanged.listen((Duration d) {
      currentDuration = d;
      setState(() {});
      debugPrint("DURATION: ${d.inSeconds}");
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocBuilder<PlayerBloc, MusicState>(
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(
                height: 100,
                child: Marquee(
                  text: widget.songModel.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 20.0,
                  velocity: 50.0,
                  pauseAfterRound: const Duration(seconds: 1),
                  startPadding: 10.0,
                  accelerationDuration: const Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: const Duration(milliseconds: 500),
                  decelerationCurve: Curves.easeOut,
                ),
              ),
              const Spacer(),
              // Text('Current duration: ${currentDuration.inSeconds}'),
              // Text('Duration: ${duration.inSeconds}'),
              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, -3),
                          blurRadius: 1)
                    ]),
                child: Column(
                  children: [
                    Slider(
                      value: currentDuration.inSeconds.toDouble(),
                      max: duration.inSeconds.toDouble(),
                      onChanged: (double value) async {
                        debugPrint('$value');
                        await player.seek(Duration(seconds: value.toInt()));
                        setState(() {});
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(currentDuration.inSeconds.toString()),
                        Text(duration.inSeconds.toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (player.volume > 0.0) {
                                player.setVolume(0.0);
                              } else {
                                player.setVolume(1.0);
                              }
                            });
                          },
                          icon: Icon(
                            player.volume > 0.0
                                ? Icons.volume_up
                                : Icons.volume_off,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (currentDuration.inSeconds > 5) {
                              await player.seek(Duration(
                                  seconds: currentDuration.inSeconds - 5));
                            }
                            setState(() {});
                          },
                          icon: const Icon(Icons.replay_5),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(
                              () {
                                if (isPlaying) {
                                  player.pause();
                                  isPlaying = !isPlaying;
                                  context.read<PlayerBloc>().add(PauseMusic());
                                } else {
                                  player.play(
                                      DeviceFileSource(widget.songModel.data));
                                  context.read<PlayerBloc>().add(
                                      PlayMusic(music: widget.songModel.data));
                                  isPlaying = !isPlaying;
                                }
                              },
                            );
                          },
                          icon:
                              Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                        ),
                        IconButton(
                          onPressed: () async {
                            await player.seek(Duration(
                                seconds: currentDuration.inSeconds + 5));
                            setState(() {});
                          },
                          icon: const Icon(Icons.forward_5),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
