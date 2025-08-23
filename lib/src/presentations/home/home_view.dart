import 'package:estopia/core/base/base_view.dart';
import 'package:estopia/core/lang/generated/l10n.dart';
import 'package:estopia/core/themes/components/anim/anim_trans_opacity.dart';
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
                GestureDetector(
                  onTap: viewModel.videoStartAndPause,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: VideoPlayer(state.videoController),
                  ),
                ),
                VideoProgressIndicator(
                  state.videoController,
                  padding: EdgeInsets.all(0),
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                    playedColor: context.color.accent,
                    bufferedColor: context.color.text4.withValues(alpha: 0.5),
                    backgroundColor: context.color.text4.withValues(alpha: 0.5),
                  ),
                ),

                /// Scroll
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(12),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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

                                        Text(
                                          "${state.index + 1}/${state.lectures.length}",
                                          style: context.typo.body1.copyWith(
                                            color: context.color.text3,
                                          ),
                                        ),

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
                                          borderRadius: BorderRadius.circular(
                                            99,
                                          ),
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
                                      child: AnimTransOpacity(
                                        isShow: switch (state.subtitleMode) {
                                          SubtitleMode.origin => true,
                                          SubtitleMode.mixed => false,
                                          SubtitleMode.korean => true,
                                        },
                                        child: CupertinoSwitch(
                                          value: switch (state.subtitleMode) {
                                            SubtitleMode.origin =>
                                              state.hasOriginBold,
                                            SubtitleMode.mixed =>
                                              state.hasEnglishReorder,
                                            SubtitleMode.korean =>
                                              state.hasEnglishReorder,
                                          },
                                          activeTrackColor:
                                              context.color.accent,
                                          onChanged: switch (state
                                              .subtitleMode) {
                                            SubtitleMode.origin =>
                                              viewModel.changeOriginBold,
                                            SubtitleMode.mixed =>
                                              viewModel.changeEnglishReorder,
                                            SubtitleMode.korean =>
                                              viewModel.changeEnglishReorder,
                                          },
                                        ),
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
                                  child: () {
                                    final isHighlighted =
                                        switch (state.subtitleMode) {
                                          SubtitleMode.origin =>
                                            state.hasOriginBold,
                                          SubtitleMode.mixed => true,
                                          SubtitleMode.korean =>
                                            state.hasEnglishReorder,
                                        };
                                    return isHighlighted
                                        ? HighlightedText(
                                            textAlign: TextAlign.center,
                                            state.subtitle.highlightedText,
                                            color: state.subtitleMode.isMixed
                                                ? context.color.text1
                                                      .withValues(
                                                        alpha: 0.25,
                                                      )
                                                : context.color.accent,
                                          )
                                        : Text(
                                            state.subtitle.text,
                                            textAlign: TextAlign.center,
                                          );
                                  }(),
                                ),
                              ),
                              const SizedBox(height: 24),
                              AnimTransOpacity(
                                isShow: switch (state.subtitleMode) {
                                  SubtitleMode.origin => state.hasOriginBold,
                                  SubtitleMode.mixed => false,
                                  SubtitleMode.korean =>
                                    state.hasEnglishReorder,
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Palette.grey100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 32,
                                  ),
                                  child: Text(
                                    switch (state.subtitleMode) {
                                      SubtitleMode.origin =>
                                        S.current.originGuide,
                                      SubtitleMode.mixed =>
                                        state.preSubtitleMode.isOrgin
                                            ? S.current.originGuide
                                            : S.current.koreanGuide,
                                      SubtitleMode.korean =>
                                        S.current.koreanGuide,
                                    },
                                    style: context.typo.body2.copyWith(
                                      color: Palette.grey500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Vocabulary
                        AnimTransOpacity(
                          isShow: state.lecture.vocabularyies.isNotEmpty,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: context.color.border,
                              ),
                            ),
                            padding: EdgeInsets.all(12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: Text(
                                    S.current.vocabulary,
                                    style: context.typo.headline4.copyWith(
                                      color: context.color.accent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ...state.lecture.vocabularyies.map((
                                  vocabulary,
                                ) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          vocabulary.word,
                                          textAlign: TextAlign.start,
                                          style: context.typo.headline6
                                              .copyWith(
                                                fontWeight:
                                                    context.typo.semiBold,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: vocabulary.meanings.entries
                                              .map(
                                                (entry) {
                                                  final (pos, meaning) = (
                                                    entry.key,
                                                    entry.value,
                                                  );
                                                  return Text(
                                                    "$pos. $meaning",
                                                    style: context.typo.body1,
                                                  );
                                                },
                                              )
                                              .toList()
                                              .gap(8),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ].gap(16),
                            ),
                          ),
                        ),
                      ].gap(8),
                    ),
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
