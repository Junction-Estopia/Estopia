import 'package:estopia/core/base/base_view.dart';
import 'package:estopia/core/themes/components/buttons/button.dart';
import 'package:estopia/core/themes/components/loader/loader.dart';
import 'package:estopia/core/themes/components/text/highlighted_text.dart';
import 'package:estopia/src/domain/entities/subtitle_mode.dart';
import 'package:estopia/src/presentations/home/home_view_model.dart';
import 'package:estopia/src/presentations/home/home_view_state.dart';
import 'package:estopia/src/services/theme_service.dart';
import 'package:flutter/cupertino.dart';
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
                /// Video
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(state.videoController),
                ),

                /// Subtitle mode
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: SubtitleMode.values.map((mode) {
                    final hasFocus = mode == state.subtitleMode;
                    return Button(
                      text: mode.label,
                      textStyle: context.typo.body1.copyWith(
                        fontWeight: hasFocus
                            ? context.typo.semiBold
                            : context.typo.regular,
                      ),
                      textColor: hasFocus
                          ? context.color.text1
                          : context.color.text4,

                      onTap: () {
                        viewModel.changeSubtitleModel(mode);
                      },
                    );
                  }).toList(),
                ),

                /// Subtitle
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  margin: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: context.color.text4,
                    ),
                  ),
                  child: Row(
                    children: [
                      /// Left button
                      Button(
                        padding: EdgeInsets.all(0),
                        builder: (isPressed) => Icon(
                          CupertinoIcons.chevron_left,
                        ),
                        onTap: () {},
                      ),

                      /// Subscription
                      Expanded(
                        child: switch (state.subtitleMode) {
                          SubtitleMode.origin => () {
                            final origin = state.lecture.subtitle.origin;
                            return state.hasOriginBold
                                ? HighlightedText(origin.highlightedText)
                                : Text(origin.text);
                          }(),
                          SubtitleMode.mixed => Text(
                            state.lecture.subtitle.mixed,
                          ),
                          SubtitleMode.korean => Text(
                            state.lecture.subtitle.korean,
                          ),
                        },
                      ),

                      /// Right button
                      Button(
                        padding: EdgeInsets.all(0),
                        builder: (isPressed) => Icon(
                          CupertinoIcons.chevron_right,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          },
        ),
      ),
    );
  }
}
