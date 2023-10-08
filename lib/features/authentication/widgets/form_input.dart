import 'package:flutter/material.dart';
import 'package:ticktok/constants/gaps.dart';

class FormInput extends StatelessWidget {
  final TextEditingController inputController;
  final void Function() onSubmitted;
  final String? Function() validation;

  final String? hintText;
  final bool isEnabled;
  final TextInputType keyboardType;
  final bool hideInput;
  final Widget? suffixWidget;
  final bool gapAtBottom;

  const FormInput({
    required this.inputController,
    required this.onSubmitted,
    required this.validation,
    this.hintText,
    this.isEnabled = true,
    this.keyboardType = TextInputType.text,
    this.hideInput = false,
    this.suffixWidget,
    this.gapAtBottom = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          enabled: isEnabled,
          keyboardType: keyboardType,
          autocorrect: false,
          controller: inputController,
          obscureText: hideInput,
          onSubmitted: (value) => onSubmitted(),
          onEditingComplete: () => onSubmitted(),
          decoration: InputDecoration(
            hintText: hintText,
            errorText: validation(),
            suffix: suffixWidget,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
          ),
          cursorColor: Theme.of(context).primaryColor,
        ),
        if (gapAtBottom) Gaps.v16,
      ],
    );
  }
}
