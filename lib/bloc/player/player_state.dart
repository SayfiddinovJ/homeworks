import 'package:equatable/equatable.dart';
import 'package:homeworks/data/status.dart';

class MusicState extends Equatable {
  const MusicState({
    required this.music,
    required this.status,
    required this.statusText,
  });

  // final player = AudioPlayer();
  final FormStatus status;
  final String statusText;
  final String music;

  MusicState copyWith({
    FormStatus? status,
    String? statusText,
    String? music,
  }) =>
      MusicState(
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,
        music: music ?? this.music,
      );

  @override
  List<Object?> get props => [status, statusText];
}
