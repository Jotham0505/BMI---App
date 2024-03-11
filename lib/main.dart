import 'package:flutter/material.dart';
import 'package:bmi/screens/input_page.dart';


void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0XFF0A0D22),
        appBarTheme: const AppBarTheme(color: Color(0XFF0A0D22)),
      ),
      home: const InputPage(),
    );
  }
}


