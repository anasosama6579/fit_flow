import 'package:firebase_core/firebase_core.dart';
import 'package:fit_flow/core/di/dependency_injection.dart';
import 'package:fit_flow/core/helper/my_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fit_flow/core/routing/app_router.dart';
import 'package:fit_flow/core/storage/hive_helper.dart';
import 'package:fit_flow/core/storage/shared_pref_helper.dart';
import 'package:fit_flow/firebase_options.dart';
import 'package:fit_flow/main.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefsHelper.init();
  await HiveHelper.init();
  await setupGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(FitFlowApp(appRouter: AppRouter()));
}
