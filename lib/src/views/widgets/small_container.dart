import 'package:bluestone_assignment/core/utils/colors.dart';
import 'package:bluestone_assignment/src/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SmallContainer extends StatelessWidget {
  final String? rating;
  final String? reviewCount;
  final IconData? icon;
  final String? endText;
  final bool showDivider;
  final Color color;

  const SmallContainer({
    super.key,
    this.rating,
    this.reviewCount,
    this.icon,
    this.endText,
    this.showDivider = true,
    this.color = Colors.yellow,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.blue),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: color),
            const SizedBox(width: 4),
          ],
          if (rating != null) AppText(rating!),
          if (showDivider) ...[
            const SizedBox(width: 6),
            Container(
              height: 2.h,
              width: 1,
              color: AppColors.black,
            ),
            const SizedBox(width: 6),
          ],
          if (reviewCount != null)
            AppText("${reviewCount!} ${endText ?? 'Reviews'}",
                style: theme.bodySmall),
          
          
        ],
      ),
    );
  }
}
