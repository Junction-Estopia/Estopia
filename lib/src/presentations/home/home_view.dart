import 'package:estopia/core/base/base_view.dart';
import 'package:estopia/core/lang/generated/l10n.dart';
import 'package:estopia/core/themes/components/buttons/button.dart';
import 'package:estopia/core/themes/components/extensions/gap.dart';
import 'package:estopia/core/themes/components/loader/loader.dart';
import 'package:estopia/core/themes/components/text/highlighted_text.dart';
import 'package:estopia/core/themes/resources/palette.dart';
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
      onInit: (context, viewModel) => viewModel.init(0),
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

                /// Scroll
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: Column(
                    children: [
                      /// Subtitle mode
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: context.color.border,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: SubtitleMode.values.map((mode) {
                            final hasFocus = mode == state.subtitleMode;
                            return Button(
                              text: mode.label,
                              height: 32,
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: hasFocus
                                      ? [
                                          Color(0xFF54CAEF),
                                          Color(0xFF3246F7),
                                        ]
                                      : [
                                          context.color.surface,
                                          context.color.surface,
                                        ],
                                ),
                              ),
                              textStyle: context.typo.body1.copyWith(
                                fontWeight: hasFocus
                                    ? context.typo.bold
                                    : context.typo.semiBold,
                              ),
                              textColor: hasFocus
                                  ? Palette.white
                                  : context.color.text4,

                              onTap: () {
                                viewModel.changeSubtitleModel(mode);
                              },
                            );
                          }).toList(),
                        ),
                      ),

                      /// Subtitle
                      AnimatedContainer(
                        duration: Duration(microseconds: 333),
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: context.color.border,
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                                bottom: 12,
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const SizedBox(width: double.infinity),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      /// Left button
                                      Button(
                                        disabled: !state.isPrevious,
                                        padding: EdgeInsets.all(0),
                                        builder: (isPressed) => Icon(
                                          CupertinoIcons.chevron_left,
                                          color: isPressed
                                              ? context.color.text4
                                              : context.color.text1,
                                        ),
                                        onTap: () {
                                          viewModel.changeLecture(
                                            state.index - 1,
                                          );
                                        },
                                      ),

                                      const SizedBox(width: 16),

                                      /// Right button
                                      Button(
                                        disabled: !state.isNext,
                                        padding: EdgeInsets.all(0),
                                        builder: (isPressed) => Icon(
                                          CupertinoIcons.chevron_right,
                                          color: isPressed
                                              ? context.color.text4
                                              : context.color.text1,
                                        ),
                                        onTap: () {
                                          viewModel.changeLecture(
                                            state.index + 1,
                                          );
                                        },
                                      ),
                                    ],
                                  ),

                                  /// Speed
                                  Positioned(
                                    left: 0,
                                    child: Button(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(99),
                                        border: Border.all(
                                          color: context.color.border,
                                        ),
                                      ),
                                      height: 32,
                                      width: 55,
                                      padding: EdgeInsets.all(0),
                                      text: state.playerSpeed.label,
                                      textStyle: context.typo.body1,
                                      onTap: viewModel.changePlayerSpeed,
                                    ),
                                  ),

                                  /// Action
                                  Positioned(
                                    right: 0,
                                    child: CupertinoSwitch(
                                      value: state.hasOriginBold,
                                      activeTrackColor: context.color.accent,
                                      onChanged: viewModel.changeOriginBold,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// Subscription
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16,
                              ),
                              child: DefaultTextStyle(
                                style: context.typo.headline4,
                                child: switch (state.subtitleMode) {
                                  SubtitleMode.origin => () {
                                    final origin =
                                        state.lecture.subtitle.origin;
                                    return state.hasOriginBold
                                        ? HighlightedText(
                                            textAlign: TextAlign.center,
                                            origin.highlightedText,
                                            color: context.color.accent,
                                          )
                                        : Text(
                                            origin.text,
                                            textAlign: TextAlign.center,
                                          );
                                  }(),
                                  SubtitleMode.mixed => Text(
                                    state.lecture.subtitle.mixed,
                                    textAlign: TextAlign.center,
                                  ),
                                  SubtitleMode.korean => Text(
                                    state.lecture.subtitle.korean,
                                    textAlign: TextAlign.center,
                                  ),
                                },
                              ),
                            ),

                            const SizedBox(height: 24),

                            Container(
                              decoration: BoxDecoration(
                                color: Palette.grey100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 32,
                              ),
                              child: Text(
                                S.current.originGuide,
                                style: context.typo.body2.copyWith(
                                  color: Palette.grey500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].gap(8),
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
