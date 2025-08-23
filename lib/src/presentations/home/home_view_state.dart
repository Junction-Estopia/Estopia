import 'package:estopia/src/domain/entities/lecture.dart';
import 'package:estopia/src/domain/entities/player_speed.dart';
import 'package:estopia/src/domain/entities/subtitle.dart';
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
  final SubtitleMode preSubtitleMode;
  final SubtitleMode subtitleMode;
  final bool hasOriginBold;
  final bool hasEnglishReorder;
  final bool isPlaying;
  final VideoPlayerController videoController;
  final PlayerSpeed playerSpeed;

  Lecture get lecture => lectures[index];
  bool get isPrevious => index > 0;
  bool get isNext => index < lectures.length - 1;
  HighlightedSubtitle get subtitle => switch (subtitleMode) {
    SubtitleMode.origin => lecture.subtitle.origin,
    SubtitleMode.mixed => lecture.subtitle.mixed,
    SubtitleMode.korean => lecture.subtitle.korean,
  };

  LoadedState({
    required super.index,
    required super.lectures,
    required this.preSubtitleMode,
    this.playerSpeed = PlayerSpeed.x1_0,
    required this.subtitleMode,
    required this.hasOriginBold,
    required this.hasEnglishReorder,
    required this.isPlaying,
    required this.videoController,
  });

  LoadedState copyWith({
    int? index,
    List<Lecture>? lectures,
    PlayerSpeed? playerSpeed,
    SubtitleMode? preSubtitleMode,
    SubtitleMode? subtitleMode,
    bool? hasOriginBold,
    bool? hasEnglishReorder,
    bool? isPlaying,
    VideoPlayerController? videoController,
  }) {
    return LoadedState(
      index: index ?? this.index,
      lectures: lectures ?? this.lectures,
      playerSpeed: playerSpeed ?? this.playerSpeed,
      preSubtitleMode: preSubtitleMode ?? this.preSubtitleMode,
      subtitleMode: subtitleMode ?? this.subtitleMode,
      hasOriginBold: hasOriginBold ?? this.hasOriginBold,
      hasEnglishReorder: hasEnglishReorder ?? this.hasEnglishReorder,
      isPlaying: isPlaying ?? this.isPlaying,
      videoController: videoController ?? this.videoController,
    );
  }
}
