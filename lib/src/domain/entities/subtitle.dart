class Subtitle {
  final OriginSubtitle origin;
  final String mixed;
  final String korean;

  const Subtitle({
    required this.origin,
    required this.mixed,
    required this.korean,
  });
}

class OriginSubtitle {
  final String text;
  final String highlightedText;

  const OriginSubtitle({
    required this.text,
    required this.highlightedText,
  });
}
