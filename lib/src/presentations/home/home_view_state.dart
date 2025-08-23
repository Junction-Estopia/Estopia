import 'package:estopia/src/domain/entities/lecture.dart';
import 'package:estopia/src/domain/entities/subtitle_mode.dart';
import 'package:video_player/video_player.dart';

sealed class HomeViewState {}

class LoadingState extends HomeViewState {}

class LoadedState extends HomeViewState {
  final Lecture lecture;
  final SubtitleMode subtitleMode;
  final bool hasOriginBold;
  final VideoPlayerController videoController;

  LoadedState({
    required this.lecture,
    required this.subtitleMode,
    required this.hasOriginBold,
    required this.videoController,
  });

  LoadedState copyWith({
    Lecture? lecture,
    SubtitleMode? subtitleMode,
    bool? hasOriginBold,
    VideoPlayerController? videoController,
  }) {
    return LoadedState(
      lecture: lecture ?? this.lecture,
      subtitleMode: subtitleMode ?? this.subtitleMode,
      hasOriginBold: hasOriginBold ?? this.hasOriginBold,
      videoController: videoController ?? this.videoController,
    );
  }
}
