import 'package:flutter/material.dart';
import 'package:ticktok/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final bool disabled;
  final void Function(BuildContext) onButtonTapped;

  const FormButton({
    super.key,
    required this.disabled,
    required this.onButtonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!disabled) onButtonTapped(context);
      },
      child: FractionallySizedBox(
        widthFactor: 1,
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size14,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.size5),
            color: disabled
                ? Colors.grey.shade400
                : Theme.of(context).primaryColor,
          ),
          duration: const Duration(
            milliseconds: 200,
          ),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(
              milliseconds: 200,
            ),
            style: TextStyle(
              color: disabled ? Colors.grey.shade600 : Colors.white,
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w500,
            ),
            child: const Text(
              "Next",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
