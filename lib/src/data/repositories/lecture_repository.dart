import 'package:estopia/src/domain/entities/lecture.dart';
import 'package:estopia/src/domain/entities/subtitle.dart';

class LectureRepository {
  List<Lecture> fetch() {
    return [
      Lecture(
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
      ),
      Lecture(
        video: "assets/videos/sample2.mp4",
        videoAspectRatio: 16 / 9,
        duration: 7,
        subtitle: Subtitle(
          origin: OriginSubtitle(
            text:
                "There are three primary theories cocerning sediment flow rate. Each of these theories can be further subcategorized.",
            highlightedText:
                "There are three primary theories <b>Cocerning</b> sediment flow rate. Each of these theories <b>can be further subcategorized</b>.",
          ),
          mixed:
              "it's the last thing i do is 운전 that car I will take that life men thousand times",
          korean: "제가 할 수 있는 일이 없을까요? 뭐 하시고 싶은 거는요?",
        ),
      ),
    ];
  }
}
