import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    super.key,
    this.textAlign,
    this.style,
    this.maxLines,
    this.width,
    this.textDecoration,
    this.overflow,
  });
  final String data;
  final TextAlign? textAlign;
  final TextStyle? style;
  final int? maxLines;
  final double? width;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        data,
        textScaler: TextScaler.noScaling,
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        style: style,
      ),
    );
  }
}
