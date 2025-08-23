import 'package:estopia/src/domain/entities/lecture.dart';
import 'package:video_player/video_player.dart';

sealed class HomeViewState {}

class LoadingState extends HomeViewState {}

class LoadedState extends HomeViewState {
  final Lecture lecture;
  final VideoPlayerController videoPlayerController;

  LoadedState({
    required this.lecture,
    required this.videoPlayerController,
  });
}
