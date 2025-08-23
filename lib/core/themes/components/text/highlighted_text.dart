import 'package:flutter/material.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  const HighlightedText(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final spans = <TextSpan>[];
    final regex = RegExp(r"<b>(.*?)<\/b>");
    int lastMatchEnd = 0;

    for (final match in regex.allMatches(text)) {
      if (match.start > lastMatchEnd) {
        spans.add(
          TextSpan(
            text: text.substring(lastMatchEnd, match.start),
            style: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        );
      }

      spans.add(
        TextSpan(
          text: match.group(1),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      );

      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(lastMatchEnd),
          style: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
      );
    }

    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: spans,
      ),
    );
  }
}
