import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticktok/constants/gaps.dart';

class InputCheckBox extends StatelessWidget {
  final String content;
  final bool isValidated;

  const InputCheckBox({
    required this.content,
    required this.isValidated,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isValidated
              ? FontAwesomeIcons.circleCheck
              : FontAwesomeIcons.circleXmark,
          size: 18,
          color: isValidated ? Colors.red.shade600 : Colors.green.shade500,
        ),
        Gaps.h5,
        Text(content),
      ],
    );
  }
}
