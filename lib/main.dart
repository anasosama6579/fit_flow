import 'package:flutter/material.dart';

void main() {
  runApp(const FitFlowApp(appTitle: 'Fit Flow'));
}

class FitFlowApp extends StatelessWidget {
  const FitFlowApp({super.key, required this.appTitle});

  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: _HomePage(title: appTitle),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          'Running $title',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
