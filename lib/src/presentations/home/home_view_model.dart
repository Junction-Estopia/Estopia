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

  void init(int index) {
    final lectures = lectureRepository.fetch();
    final lecture = lectures[index];
    final videoController = VideoPlayerController.asset(
      lecture.video,
    )..setLooping(true);
    videoController.initialize().then((_) {
      videoController.play();
      emit(
        LoadedState(
          index: index,
          lectures: lectures,
          subtitleMode: SubtitleMode.origin,
          hasOriginBold: true,
          videoController: videoController,
        ),
      );
    });
  }

  void changeSubtitleModel(SubtitleMode subtitleMode) {
    final loadedState = state as LoadedState;
    emit(loadedState.copyWith(subtitleMode: subtitleMode));
  }

  void changeLecture(int index) {
    final loadedState = state as LoadedState;
    loadedState.videoController.dispose();
    init(index);
  }
}
