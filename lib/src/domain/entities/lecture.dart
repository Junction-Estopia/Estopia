import 'package:estopia/src/domain/entities/subtitle.dart';

class Lecture {
  final String video;
  final double videoAspectRatio;
  final int duration;
  final Subtitle subtitle;

  const Lecture({
    required this.video,
    required this.videoAspectRatio,
    required this.duration,
    required this.subtitle,
  });
}
