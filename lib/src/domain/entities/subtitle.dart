class Subtitle {
  final HighlightedSubtitle origin;
  final HighlightedSubtitle mixed;
  final HighlightedSubtitle korean;

  const Subtitle({
    required this.origin,
    required this.mixed,
    required this.korean,
  });
}

class HighlightedSubtitle {
  final String text;
  final String highlightedText;

  const HighlightedSubtitle({
    required this.text,
    required this.highlightedText,
  });
}
