import 'package:flutter/material.dart';
import 'package:ticktok/constants/gaps.dart';
import 'package:ticktok/constants/sizes.dart';

class TutorialPiece extends StatelessWidget {
  final String title, descrition;

  const TutorialPiece({
    required this.title,
    required this.descrition,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: Sizes.size36,
            fontWeight: FontWeight.w700,
            height: 1.2,
            letterSpacing: 0.5,
          ),
        ),
        Gaps.v8,
        Text(
          descrition,
          style: const TextStyle(
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
