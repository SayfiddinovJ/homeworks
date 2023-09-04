import 'package:equatable/equatable.dart';

abstract class PlayerEvent extends Equatable {}

class PlayMusic extends PlayerEvent {
  PlayMusic({required this.music});

  final String music;

  @override
  List<Object?> get props => [music];
}

class PauseMusic extends PlayerEvent {
  @override
  List<Object?> get props => [];
}

class ResumeMusic extends PlayerEvent {
  @override
  List<Object?> get props => [];
}
class StopMusic extends PlayerEvent {
  @override
  List<Object?> get props => [];
}