import 'package:firebase_core/firebase_core.dart';
import 'package:fit_flow/core/di/dependency_injection.dart';
import 'package:fit_flow/core/storage/hive_helper.dart';
import 'package:fit_flow/core/storage/shared_pref_helper.dart';
import 'package:fit_flow/firebase_options.dart';
import 'package:fit_flow/main.dart';
import 'package:flutter/material.dart';
import 'package:fit_flow/core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefsHelper.init();
  await HiveHelper.init();
  await setupGetIt();
  runApp(FitFlowApp(appRouter: AppRouter(),));
}
