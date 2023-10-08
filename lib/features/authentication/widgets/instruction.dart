import 'package:flutter/material.dart';
import 'package:ticktok/constants/gaps.dart';
import 'package:ticktok/constants/sizes.dart';

class Instruction extends StatelessWidget {
  final String title, description;
  final bool gapAtBottom;

  const Instruction({
    required this.title,
    required this.description,
    this.gapAtBottom = true,
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
            fontSize: Sizes.size20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Gaps.v4,
        const Text(
          "You can always change this later.",
          style: TextStyle(
            fontSize: Sizes.size14,
            color: Colors.black54,
          ),
        ),
        if (gapAtBottom) Gaps.v4,
      ],
    );
  }
}
