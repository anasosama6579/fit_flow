import 'package:fit_flow/core/helper/assets.dart';
import 'package:fit_flow/core/routing/routes.dart';
import 'package:fit_flow/core/theming/app_colors.dart';
import 'package:fit_flow/core/theming/app_styles.dart';
import 'package:fit_flow/features/onboarding/data/repos/shared_prefs_onboarding_repo_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  Future<void> _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    if (SharedPrefsOnboardingRepoImp().isOnboardingCompleted()) {
      Navigator.pushReplacementNamed(context, Routes.home);
    } else {
      Navigator.pushReplacementNamed(context, Routes.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.logoSvg, width: 128.w, height: 128.h),
            SizedBox(height: 20.h),
            Text('FitFlow', style: AppStyles.font30BoldWhite),
            Text(
              "Elevate Your Movement",
              style: AppStyles.font14LightWhite.copyWith(letterSpacing: 2.8.w),
            ),
          ],
        ),
      ),
    );
  }
}
