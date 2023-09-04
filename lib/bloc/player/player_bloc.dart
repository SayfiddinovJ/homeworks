import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homeworks/bloc/player/player_event.dart';
import 'package:homeworks/bloc/player/player_state.dart';
import 'package:homeworks/data/status.dart';
import 'package:homeworks/utils/app_musics.dart';

class PlayerBloc extends Bloc<PlayerEvent, MusicState> {
  PlayerBloc()
      : super(MusicState(
            status: FormStatus.pure, statusText: '', music: AppMusics.iPhone)) {
    on<PlayMusic>(_playMusic);
    on<PauseMusic>(_pauseMusic);
    on<ResumeMusic>(_resumeMusic);
    on<StopMusic>(_stopMusic);
  }

  _playMusic(PlayMusic event, Emitter<MusicState> emit) {
    emit(state.copyWith(
        status: FormStatus.playing, statusText: 'Playing', music: event.music));
  }

  _pauseMusic(PauseMusic event, Emitter<MusicState> emit) {
    emit(state.copyWith(statusText: 'Paused', status: FormStatus.pause));
  }

  _stopMusic(StopMusic event, Emitter<MusicState> emit) {
    emit(state.copyWith(statusText: 'Stopped', status: FormStatus.stop));
  }

  _resumeMusic(ResumeMusic event, Emitter<MusicState> emit) {
    emit(state.copyWith(statusText: 'Resume', status: FormStatus.resume));
  }
}
