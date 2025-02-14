import 'package:bluestone_assignment/core/utils/colors.dart';
import 'package:bluestone_assignment/src/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar {
  static PreferredSizeWidget bsAppBar({
    required TextTheme theme,
    required String title,
    required Function() onBack,
    bool showLeading = true,
    IconData? suffixIcon,
    Function()? onSuffixTap,
    Color backgroundColor = AppColors.primaryColor,
    Color iconColor = AppColors.white,
    Color suffixIconColor = AppColors.white,
    bool centerTitle = true,
  }) {
    return AppBar(
      toolbarHeight: 7.h,
      elevation: 0,
      backgroundColor: backgroundColor,
      centerTitle: false, // Disable Flutter's default centering behavior

      // Fixed size leading
      leading: SizedBox(
        width: 15.w, // Keep the space fixed
        child: showLeading
            ? Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new_rounded, size: 20.sp),
                  color: iconColor,
                  onPressed: onBack,
                ),
              )
            : null,
      ),

      // Title in a Stack to ensure proper alignment
      title: Stack(
        alignment: Alignment.center,
        children: [
          if (centerTitle)
            Align(
              alignment: Alignment.center,
              child: AppText(
                title,
                style: theme.titleLarge?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          else
            Align(
              alignment: Alignment.centerLeft,
              child: AppText(
                title,
                style: theme.titleLarge?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),

      // Fixed size trailing
      actions: [
        SizedBox(
          width: 15.w,
          child: suffixIcon != null
              ? IconButton(
                  onPressed: onSuffixTap,
                  icon: Icon(
                    suffixIcon,
                    color: suffixIconColor,
                    size: 8.w,
                  ),
                )
              : null,
        ),
      ],
    );
  }
}
