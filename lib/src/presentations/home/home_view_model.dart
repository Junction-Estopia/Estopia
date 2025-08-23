import 'package:estopia/core/base/base_view_model.dart';
import 'package:estopia/src/data/repositories/lecture_repository.dart';
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
    final videoPlayerController = VideoPlayerController.asset(
      "assets/videos/sample.mp4",
    )..setLooping(true);
    videoPlayerController.initialize().then((_) {
      videoPlayerController.play();
      emit(
        LoadedState(
          lecture: lecture,
          videoPlayerController: videoPlayerController,
        ),
      );
    });
  }
}
