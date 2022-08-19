import 'package:flutter/material.dart';

import 'screens/bmi_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme:
          ThemeData(primarySwatch: Colors.indigo, primaryColor: Colors.white),
      home: const BMICalculator(),
    );
  }
}
