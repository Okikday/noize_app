import 'package:flutter/material.dart';
import 'package:noize_app/common/styles/noize_themes.dart';
import 'package:noize_app/noize_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noize App',
      theme: NoizeThemes.lightTheme,
      darkTheme: NoizeThemes.darkTheme,
      home: const NoizeSplashScreen(),

      
    );
  }
}