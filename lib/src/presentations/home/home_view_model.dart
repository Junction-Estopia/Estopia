import 'package:estopia/core/base/base_view_model.dart';
import 'package:estopia/src/data/repositories/lecture_repository.dart';
import 'package:estopia/src/domain/entities/subtitle_mode.dart';
import 'package:estopia/src/presentations/home/home_view_state.dart';
import 'package:video_player/video_player.dart';

class HomeViewModel extends BaseViewModel<HomeViewState> {
  HomeViewModel(
    super.initialState, {
    required this.lectureRepository,
  });

  final LectureRepository lectureRepository;

  void init() {
    final lecture = lectureRepository.get();
    final videoController = VideoPlayerController.asset(
      "assets/videos/sample.mp4",
    )..setLooping(true);
    videoController.initialize().then((_) {
      videoController.play();
      emit(
        LoadedState(
          lecture: lecture,
          subtitleMode: SubtitleMode.origin,
          videoController: videoController,
        ),
      );
    });
  }

  void changeSubtitleModel(SubtitleMode subtitleMode) {
    final loadedState = state as LoadedState;
    emit(loadedState.copyWith(subtitleMode: subtitleMode));
  }
}
