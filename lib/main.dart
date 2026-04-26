import 'package:fit_flow/core/routing/app_router.dart';
import 'package:fit_flow/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FitFlowApp extends StatelessWidget {
  const FitFlowApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 884),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          initialRoute: Routes.splash,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}

