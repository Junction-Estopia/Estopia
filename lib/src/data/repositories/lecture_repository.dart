import 'package:estopia/src/domain/entities/lecture.dart';
import 'package:estopia/src/domain/entities/subtitle.dart';

class LectureRepository {
  Lecture get() {
    return Lecture(
      video: "assets/videos/sample.mp4",
      videoAspectRatio: 16 / 9,
      duration: 7,
      subtitle: Subtitle(
        origin:
            "it's the last thing i do is drive that car I will take that life men thousand times",
        mixed:
            "it's the last thing i do is 운전 that car I will take that life men thousand times",
        ko: "제가 할 수 있는 일이 없을까요? 뭐 하시고 싶은 거는요?",
      ),
    );
  }
}
