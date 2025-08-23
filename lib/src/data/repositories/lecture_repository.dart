import 'package:estopia/src/domain/entities/lecture.dart';
import 'package:estopia/src/domain/entities/subtitle.dart';

class LectureRepository {
  Lecture get() {
    return Lecture(
      video: "assets/videos/sample.mp4",
      videoAspectRatio: 16 / 9,
      duration: 7,
      subtitle: Subtitle(
        origin: OriginSubtitle(
          text:
              "it's the last thing i do is drive that car I will take that life men thousand times",
          highlightedText:
              "it's the <b>last thing</b> i do is <b>drive that car</b> I will take that life men thousand times",
        ),
        mixed:
            "it's the last thing i do is 운전 that car I will take that life men thousand times",
        korean: "제가 할 수 있는 일이 없을까요? 뭐 하시고 싶은 거는요?",
      ),
    );
  }
}
