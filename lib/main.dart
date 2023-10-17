import 'package:flutter/material.dart';
import 'package:ticktok/constants/sizes.dart';
import 'package:ticktok/features/main_navigation/main_navigation_screen.dart';

void main() {
  runApp(const TickTokApp());
}

class TickTokApp extends StatelessWidget {
  const TickTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ticktok",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE9435A),
        useMaterial3: true,
        canvasColor: Colors.white,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          surfaceTintColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          centerTitle: true,
        ),
      ),
      home: const MainNavigationScreen(),
    );
  }
}
