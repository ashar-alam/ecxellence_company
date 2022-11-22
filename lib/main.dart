import 'package:ecxellence_company/screens/homepage_screen.dart';
import 'package:ecxellence_company/utils/app_style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppStyle.red,
      ),
      home: const MyHomepageScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
