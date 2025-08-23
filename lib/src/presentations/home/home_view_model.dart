import 'package:estopia/core/base/base_view_model.dart';
import 'package:estopia/src/presentations/home/home_view_state.dart';
import 'package:video_player/video_player.dart';

class HomeViewModel extends BaseViewModel<HomeViewState> {
  HomeViewModel(super.initialState);

  final VideoPlayerController videoPlayerController =
      VideoPlayerController.asset(
        "assets/videos/sample.mp4",
      );
}
