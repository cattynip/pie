import 'package:flutter/material.dart';
import 'package:ticktok/constants/sizes.dart';

class BottomButton extends StatelessWidget {
  final String content;
  final bool isActive;
  final void Function() onButtonTapped;

  const BottomButton({
    required this.content,
    required this.isActive,
    required this.onButtonTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTapped,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(Sizes.size5),
          border: isActive
              ? null
              : Border.all(
                  color: Colors.black.withOpacity(0.1),
                ),
        ),
        child: Center(
          child: Text(
            content,
            style: TextStyle(
              fontSize: Sizes.size16,
              color: isActive ? Colors.white : Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
