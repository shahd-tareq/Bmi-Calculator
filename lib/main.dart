import 'package:flutter/material.dart';
import 'calculator_screen.dart';
import 'results_screen.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF121212),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      // سطر التنقل بين الاسكرينات
      initialRoute: '/',
      routes: {
        '/': (context) => CalculatorScreen(),
        '/results': (context) => ResultsScreen(),
      },
    );
  }
}

// اخر جزء ده ممكن نستبدل    home: CalculatorScreen(),
