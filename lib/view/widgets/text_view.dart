import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String text;
  final int maxLine;
  final TextAlign textAlign;
  final TextStyle? style;

  @override
  const TextView({
    Key? key,
    required this.text,
    this.maxLine = 1,
    this.textAlign = TextAlign.start,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}

class MyRichText extends StatelessWidget {
  const MyRichText({
    Key? key,
    this.text1 = '',
    this.text2 = '',
    this.text3 = '',
    this.textAlign = TextAlign.start,
    this.style1,
    this.style2,
    this.style3,
  }) : super(key: key);
  final String text1, text2, text3;
  final TextStyle? style1, style2, style3;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(text: text1, style: style1, children: [
        TextSpan(
          text: text2,
          style: style2,
        ),
        TextSpan(
          text: text3,
          style: style3,
        ),
      ]),
    );
  }
}
