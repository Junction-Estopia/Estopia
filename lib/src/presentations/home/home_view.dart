import 'package:estopia/core/base/base_view.dart';
import 'package:estopia/core/lang/generated/l10n.dart';
import 'package:estopia/core/themes/components/video/video_viewer.dart';
import 'package:estopia/src/presentations/home/home_view_model.dart';
import 'package:estopia/src/presentations/home/home_view_state.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      create: (context) => HomeViewModel(
        HomeViewState(),
      ),
      builder: (context, viewModel, state) => Scaffold(
        appBar: AppBar(
          title: Text(S.current.appName),
        ),
        body: AspectRatio(
          aspectRatio: 16 / 9,
          child: VideoViewer(controller: viewModel.videoPlayerController),
        ),
      ),
    );
  }
}
