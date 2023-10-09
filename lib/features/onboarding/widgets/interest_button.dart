import 'package:flutter/material.dart';
import 'package:ticktok/constants/sizes.dart';

class InterestButton extends StatefulWidget {
  final String interest;

  const InterestButton({
    required this.interest,
    super.key,
  });

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  void _onInterestButtonTapped() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onInterestButtonTapped,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size14,
          horizontal: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size96),
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          border: Border.all(
            color: Colors.black.withOpacity(0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: _isSelected
                  ? Colors.red.withOpacity(0.6)
                  : Colors.black.withOpacity(0.12),
              offset: const Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 0.4,
            )
          ],
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: Sizes.size14 + Sizes.size1,
            color: _isSelected ? Colors.white : Colors.black,
          ),
          child: Text(widget.interest),
        ),
      ),
    );
  }
}
