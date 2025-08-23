import 'package:estopia/src/domain/entities/lecture.dart';

class LectureRepository {
  Lecture get() {
    return Lecture(
      video: "assets/videos/sample.mp4",
      videoAspectRatio: 16 / 9,
      duration: 7,
    );
  }
}
