import 'package:avatar_element/pages/detail_screen.dart';
import 'package:avatar_element/pages/home_screen.dart';
import 'package:avatar_element/pages/onboarding_screen.dart';
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
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
      routes: {
        '/homepage': (context) => const HomeScreen(),
        '/detailpage': (context) => const DetailScreen()
      },
    );
  }
}
