import 'package:estopia/core/base/base_view.dart';
import 'package:estopia/core/themes/components/loader/loader.dart';
import 'package:estopia/src/presentations/home/home_view_model.dart';
import 'package:estopia/src/presentations/home/home_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewState, HomeViewModel>(
      create: (context) => HomeViewModel(
        LoadingState(),
        lectureRepository: context.read(),
      ),
      onInit: (context, viewModel) => viewModel.init(),
      builder: (context, viewModel, state) => Scaffold(
        body: SafeArea(
          child: switch (state) {
            LoadingState() => Loader(),
            LoadedState() => Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(state.videoPlayerController),
                ),
              ],
            ),
          },
        ),
      ),
    );
  }
}
