import 'package:estopia/src/domain/entities/subtitle.dart';
import 'package:estopia/src/domain/entities/vocabulary.dart';

class Lecture {
  final String video;
  final double videoAspectRatio;
  final int duration;
  final Subtitle subtitle;
  final List<Vocabulary> vocabularyies;

  const Lecture({
    required this.video,
    required this.videoAspectRatio,
    required this.duration,
    required this.subtitle,
    required this.vocabularyies,
  });
}
