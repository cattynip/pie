import 'package:flutter/material.dart';
import 'package:ticktok/constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final IconData buttonIcon;

  const AuthButton({
    required this.buttonText,
    required this.buttonIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Sizes.size14),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: Sizes.size2,
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Sizes.size16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
