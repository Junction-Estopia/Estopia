import 'package:estopia/core/lang/generated/l10n.dart';

enum SubtitleMode {
  origin,
  mixed,
  korean;

  String get label => switch (this) {
    SubtitleMode.origin => S.current.originMode,
    SubtitleMode.mixed => S.current.mixedMode,
    SubtitleMode.korean => S.current.koreanMode,
  };

  bool get isOrgin => this == origin;
  bool get isMixed => this == mixed;
}
