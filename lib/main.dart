import 'package:flutter/material.dart';
import 'inputpage.dart';



void main() {
  runApp(bmi());
}

class bmi extends StatelessWidget {
  const bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0xFF1D1E33)),
        scaffoldBackgroundColor: Color(0xFF1D1E33),
      ),home: InputPage(),
    );
  }
}

