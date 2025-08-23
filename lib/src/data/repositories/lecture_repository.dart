import 'package:estopia/src/domain/entities/lecture.dart';
import 'package:estopia/src/domain/entities/subtitle.dart';
import 'package:estopia/src/domain/entities/vocabulary.dart';

class LectureRepository {
  List<Lecture> fetch() {
    return [
      Lecture(
        video: "assets/videos/sample2.mp4",
        videoAspectRatio: 16 / 9,
        duration: 7,
        subtitle: Subtitle(
          origin: HighlightedSubtitle(
            text:
                "There are three primary theories cocerning sediment flow rate. Each of these theories can be further subcategorized.",
            highlightedText:
                "There are three primary theories <b>cocerning</b> sediment flow rate. Each of these theories <b>can be further subcategorized.</b>",
          ),
          mixed: HighlightedSubtitle(
            text:
                "There are 세 가지 primary 원리. Cocerning sediment flow 흐름. Each of these theories can  further .",
            highlightedText:
                "There are <b>세 가지</b> primary <b>원리</b>. Cocerning sediment flow <b>흐름</b>. Each of these theories can be further subcategorized.",
          ),
          korean: HighlightedSubtitle(
            text:
                "침전물 흐름 속도에 관한 세 가지 주요 원리가 있습니다. 이러한 각 이론은 더 세부적으로 분류될 수 있습니다.",
            highlightedText:
                "있습니다 세 가지 주요 원리가. 관한 침전물 흐름 속도에. 이러한 각 이론은 될 수 있습니다 더 더 세부적으로 분류될 수.",
          ),
        ),
        vocabularyies: [
          Vocabulary(word: "Sediment", meanings: {"N": "침전물"}),
          Vocabulary(
            word: "Concern",
            meanings: {"V": "영향을 미치다", "N": "우려, 배려"},
          ),
          Vocabulary(word: "Subcategorize", meanings: {"V": "하위 범주화하다"}),
        ],
      ),
      Lecture(
        video: "assets/videos/sample.mp4",
        videoAspectRatio: 16 / 9,
        duration: 7,
        subtitle: Subtitle(
          origin: HighlightedSubtitle(
            text:
                "There are three primary theories cocerning sediment flow rate. Each of these theories can be further subcategorized.",
            highlightedText:
                "There are three primary theories <b>cocerning</b> sediment flow rate. Each of these theories <b>can be further subcategorized</b>.",
          ),
          mixed: HighlightedSubtitle(
            text:
                "There are 세 가지 primary 원리. Cocerning sediment flow 흐름. Each of these theories can  further .",
            highlightedText:
                "There are <b>세 가지</b> primary <b>원리</b>. Cocerning sediment flow <b>흐름</b>. Each of these theories can be further subcategorized.",
          ),
          korean: HighlightedSubtitle(
            text:
                "침전물 흐름 속도에 관한 세 가지 주요 원리가 있습니다. 이러한 각 이론은 더 세부적으로 분류될 수 있습니다.",
            highlightedText:
                "있습니다 세 가지 주요 원리가. 관한 침전물 흐름 속도에. 이러한 각 이론은 될 수 있습니다 더 더 세부적으로 분류될 수.",
          ),
        ),
        vocabularyies: [
        ]
      ),
    ];
  }
}
