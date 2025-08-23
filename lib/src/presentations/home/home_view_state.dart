import 'package:estopia/src/domain/entities/lecture.dart';
import 'package:estopia/src/domain/entities/player_speed.dart';
import 'package:estopia/src/domain/entities/subtitle_mode.dart';
import 'package:video_player/video_player.dart';

sealed class HomeViewState {
  final int index;
  final List<Lecture> lectures;

  HomeViewState({required this.index, required this.lectures});
}

class LoadingState extends HomeViewState {
  LoadingState() : super(index: 0, lectures: []);
}

class LoadedState extends HomeViewState {
  final SubtitleMode subtitleMode;
  final bool hasOriginBold;
  final VideoPlayerController videoController;
  final PlayerSpeed playerSpeed;

  Lecture get lecture => lectures[index];
  bool get isPrevious => index > 0;
  bool get isNext => index < lectures.length - 1;

  LoadedState({
    required super.index,
    required super.lectures,
    this.playerSpeed = PlayerSpeed.x1_0,
    required this.subtitleMode,
    required this.hasOriginBold,
    required this.videoController,
  });

  LoadedState copyWith({
    int? index,
    List<Lecture>? lectures,
    PlayerSpeed? playerSpeed,
    SubtitleMode? subtitleMode,
    bool? hasOriginBold,
    VideoPlayerController? videoController,
  }) {
    return LoadedState(
      index: index ?? this.index,
      lectures: lectures ?? this.lectures,
      playerSpeed: playerSpeed ?? this.playerSpeed,
      subtitleMode: subtitleMode ?? this.subtitleMode,
      hasOriginBold: hasOriginBold ?? this.hasOriginBold,
      videoController: videoController ?? this.videoController,
    );
  }
}
