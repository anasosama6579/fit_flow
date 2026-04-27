import 'package:fit_flow/core/helper/assets.dart';
import 'package:fit_flow/core/theming/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFBFBFB),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("FitFlow", style: AppStyles.font20SemiBoldMainBlue),
                SvgPicture.asset(Assets.questionMarkSvg),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
