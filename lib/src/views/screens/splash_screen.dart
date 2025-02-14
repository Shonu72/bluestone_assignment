import 'package:bluestone_assignment/core/constants/asset_constant.dart';
import 'package:bluestone_assignment/core/constants/string_constant.dart';
import 'package:bluestone_assignment/core/utils/colors.dart';
import 'package:bluestone_assignment/services/routes/route_path.dart';
import 'package:bluestone_assignment/src/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.blue950,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: Image.asset(AssetConstant.logo).image,
              height: 25.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 2.h),
            AppText(
              AppString.appName,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    context.go(RoutePath.home);
  }
}
