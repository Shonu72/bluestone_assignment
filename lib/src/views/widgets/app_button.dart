import 'package:bluestone_assignment/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final double width;
  final String text;
  final Icon? icon;
  final double? fontSize;
  final Color? color;
  final Color borderColor;
  final Color? textColor;
  final String? fontFamily;
  final double? radius;

  const AppButton({
    super.key,
    required this.onTap,
    required this.width,
    required this.text,
    this.icon,
    this.fontSize,
    this.color,
    this.textColor,
    this.borderColor = AppColors.white,
    this.fontFamily,
    this.radius = 20,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 6.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius!),
          border: Border.all(
            color: borderColor,
            width: 0.6,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: theme.bodyLarge?.copyWith(
                fontSize: fontSize,
                color: textColor,
                fontFamily: fontFamily,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
