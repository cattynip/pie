import 'package:flutter/material.dart';
import 'package:ticktok/constants/gaps.dart';
import 'package:ticktok/constants/sizes.dart';

void main() {
  runApp(const TickTokApp());
}

class TickTokApp extends StatelessWidget {
  const TickTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticktok',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFFE9435A),
      ),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Sizes.size14),
          child: Container(
            child: const Column(
              children: [
                Text("dajfklasjfkl"),
                Gaps.v20,
                Text("jsfkljafkasdf"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
