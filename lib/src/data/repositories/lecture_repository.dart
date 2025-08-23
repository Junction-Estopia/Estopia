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
                "There are three primary theories concerning sediment flow rate. Each of these theories can be further subcategorized.",
            highlightedText:
                "There are <b>three primary theories</b> cocerning <b>sediment flow rate.</b> Each of these theories can be <b>further subcategorized.</b>",
          ),
          mixed: HighlightedSubtitle(
            text:
                "There are 세 가지 주요 원리 concerning sediment flow rate. 이러한 각 이론들은 can be further subcategorized.",
            highlightedText:
                "There are <b>세 가지 주요 원리</b> concerning sediment flow rate. <b>이러한 각 이론들은</b> can be further subcategorized.",
          ),
          korean: HighlightedSubtitle(
            text:
                "침전물 흐름 속도에 관한 세 가지 주요 원리가 있습니다. 이러한 각 이론은 더 세부적으로 분류될 수 있습니다.",
            highlightedText:
                "있습니다 세 가지 주요 원리가, 침전물 흐름 속도에 관련하여. 이러한 각 이론들은, 될 수 있습니다, 더 세부적으로 분류될 수.",
          ),
        ),
        vocabularyies: [
          Vocabulary(word: "sediment", meanings: {"n": "침전물"}),
          Vocabulary(
            word: "concern",
            meanings: {"v": "영향을 미치다", "n": "우려, 배려"},
          ),
          Vocabulary(word: "subcategorize", meanings: {"v": "하위 범주화하다"}),
        ],
      ),
      Lecture(
        video: "assets/videos/sample.mp4",
        videoAspectRatio: 16 / 9,
        duration: 7,
        subtitle: Subtitle(
          origin: HighlightedSubtitle(
            text:
                "I'm the girl in the veil who stomped on your heart in front of your entire family",
            highlightedText:
                "<b>I'm the girl</b> in the <b>veil</b> who <b>stomped</b> on <b>your heart</b> in front of your entire family",
          ),
          mixed: HighlightedSubtitle(
            text:
                "I'm the 여자 in the veil who stomped on 너의 마음을, 앞에서 너의 entire 가족.",
            highlightedText:
                "I'm the <b>여자</b> in the veil who stomped on <b>너의 마음을, 앞에서 너의</b> entire <b>가족</b>.",
          ),
          korean: HighlightedSubtitle(
            text: "나는 너의 모든 가족 앞에서 당신의 마음을 짓밟아버린 면사포를 쓴 여자이다.",
            highlightedText: "나는 이러한 여자이다, 면사포를 쓴, 너의 마음을 짓밟은, 너의 모든 가족 앞에서",
          ),
        ),
        vocabularyies: [
          Vocabulary(
            word: "veil",
            meanings: {"n": "베일, 면사포", "v": "베일을 쓰다, 가리다"},
          ),
          Vocabulary(
            word: "stomp on",
            meanings: {
              "v": "짓밟다",
            },
          ),
          Vocabulary(
            word: "heart",
            meanings: {
              "n": "심장, 마음",
            },
          ),
          Vocabulary(
            word: "in front of",
            meanings: {
              "prep": "~의 앞쪽에, ~가 있는 데서",
            },
          ),
          Vocabulary(
            word: "entire",
            meanings: {
              "adj": "전체의",
            },
          ),
        ],
      ),
    ];
  }
}
