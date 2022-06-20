import 'package:app_ui/screens/main_screen.dart';
import 'package:app_ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI',
      home: MainScreen(),
      theme: ThemeData(
        primaryColor: const Color(0xFF1DB954),
        accentColor: const Color(0xFF191414),
        highlightColor: Colors.white,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 56.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF191414)
          ),
          headline2: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1DB954)
          ),
          headline3: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF191414)
          ),
          headline4: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 2.0
          ),
          headline5: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.white
          ),
          headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: Colors.blue
          ),
          bodyText1: TextStyle(
            fontSize: 15.0,
            color: Colors.black
          ),
          subtitle1: TextStyle(
            fontSize: 20.0,
            color: Color(0xFF2B2B36)
          ),
          subtitle2: TextStyle(
            fontSize: 16.0,
            color: Color(0xFF2B2B36)
          )
        )
      ),
    );
  }
}