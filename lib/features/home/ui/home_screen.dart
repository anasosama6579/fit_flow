import 'package:fit_flow/features/home/ui/widgets/home_app_bar.dart';
import 'package:fit_flow/features/home/ui/widgets/home_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeAppBar(),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: HomeBlocBuilder(),
          ),
        ],
      ),
    );
  }
}
