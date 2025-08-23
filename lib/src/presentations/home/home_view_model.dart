import 'package:estopia/core/base/base_view_model.dart';
import 'package:estopia/src/data/repositories/lecture_repository.dart';
import 'package:estopia/src/domain/entities/player_speed.dart';
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
    final videoController =
        VideoPlayerController.asset(
            lecture.video,
          )
          ..setLooping(true)
          ..setPlaybackSpeed(PlayerSpeed.x1_0.ratio);
    videoController.initialize().then((_) {
      videoController.play();
      emit(
        LoadedState(
          index: index,
          lectures: lectures,
          subtitleMode: SubtitleMode.origin,
          preSubtitleMode: SubtitleMode.origin,
          isPlaying: true,
          hasOriginBold: false,
          hasEnglishReorder: false,
          videoController: videoController,
        ),
      );
    });
  }

  void changeSubtitleModel(SubtitleMode subtitleMode) {
    final loadedState = state as LoadedState;
    emit(
      loadedState.copyWith(
        preSubtitleMode: loadedState.subtitleMode,
        subtitleMode: subtitleMode,
      ),
    );
  }

  void changeLecture(int index) {
    final loadedState = state as LoadedState;
    loadedState.videoController.dispose();
    final lecture = loadedState.lectures[index];
    final videoController =
        VideoPlayerController.asset(
            lecture.video,
          )
          ..setLooping(true)
          ..setPlaybackSpeed(PlayerSpeed.x1_0.ratio);
    videoController.initialize().then((_) {
      videoController.play();
      emit(
        loadedState.copyWith(
          index: index,
          subtitleMode: SubtitleMode.origin,
          hasEnglishReorder: false,
          hasOriginBold: false,
          videoController: videoController,
        ),
      );
    });
  }

  void videoStartAndPause() {
    final loadedState = state as LoadedState;
    if (loadedState.isPlaying) {
      loadedState.videoController.pause();
    } else {
      loadedState.videoController.play();
    }
    emit(loadedState.copyWith(isPlaying: !loadedState.isPlaying));
  }

  void changePlayerSpeed() {
    final loadedState = state as LoadedState;
    final nextPlayerSpeed = loadedState.playerSpeed.next;
    loadedState.videoController.setPlaybackSpeed(nextPlayerSpeed.ratio);
    emit(
      loadedState.copyWith(
        playerSpeed: nextPlayerSpeed,
      ),
    );
  }

  void changeEnglishReorder(bool hasEnglishReorder) {
    final loadedState = state as LoadedState;
    emit(
      loadedState.copyWith(
        hasEnglishReorder: hasEnglishReorder,
      ),
    );
  }

  void changeOriginBold(bool hasOriginBold) {
    final loadedState = state as LoadedState;
    emit(
      loadedState.copyWith(
        hasOriginBold: hasOriginBold,
      ),
    );
  }
}
