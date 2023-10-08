import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticktok/constants/gaps.dart';
import 'package:ticktok/constants/sizes.dart';
import 'package:ticktok/features/authentication/birthday_screen.dart';
import 'package:ticktok/features/authentication/widgets/form_button.dart';
import 'package:ticktok/features/authentication/widgets/form_input.dart';
import 'package:ticktok/features/authentication/widgets/input_check_box.dart';
import 'package:ticktok/features/authentication/widgets/instruction.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _hidePassword = true;
  String _password = "";

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.value.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _onScaffoldTapped() {
    FocusScope.of(context).unfocus();
  }

  void _onPasswordSubmitted() {
    if (_isPasswordEmpty() || _validatePassword() != null) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  void _onDeleteButtonTapped() {
    _passwordController.clear();
  }

  void _onHidingToggleButtonTapped() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  String? _validatePassword() {
    if (_isPasswordEmpty()) return null;

    if (_isPasswordShort()) return "Password is short.";
    if (_isPasswordLong()) return "Password is long.";
    if (!_validatePasswordWithRegExp()) return "Password is not valid.";

    return null;
  }

  bool _isPasswordEmpty() {
    return _password.isEmpty;
  }

  bool _isPasswordShort() {
    return _password.length < 8;
  }

  bool _isPasswordLong() {
    return _password.length > 20;
  }

  bool _validatePasswordWithRegExp() {
    return RegExp(
      r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&\^])[A-Za-z0-9@$!%*#?&\^]{8,}$",
    ).hasMatch(_password);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTapped,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign up"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size28,
            vertical: Sizes.size20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Instruction(
                title: "Create password",
                description:
                    "You can safe your account and data in TickTok, and more.",
              ),
              FormInput(
                hintText: "Password",
                inputController: _passwordController,
                onSubmitted: _onPasswordSubmitted,
                validation: _validatePassword,
                keyboardType: TextInputType.visiblePassword,
                hideInput: _hidePassword,
                suffixWidget: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gaps.v5,
                    GestureDetector(
                      onTap: _onDeleteButtonTapped,
                      child: FaIcon(
                        FontAwesomeIcons.solidCircleXmark,
                        size: Sizes.size14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Gaps.h12,
                    GestureDetector(
                      onTap: _onHidingToggleButtonTapped,
                      child: Icon(
                        _hidePassword
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        size: Sizes.size14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    Gaps.h5,
                  ],
                ),
              ),
              Gaps.v7,
              const Text(
                "You password must have:",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gaps.v7,
              Column(
                children: [
                  InputCheckBox(
                    content: "8 to 20 characters",
                    isValidated: _isPasswordShort() ^ _isPasswordLong(),
                  ),
                  Gaps.v3,
                  InputCheckBox(
                    content: "Letters, numbers, and special characters",
                    isValidated: !_validatePasswordWithRegExp(),
                  ),
                ],
              ),
              Gaps.v44,
              FormButton(
                onButtonTapped: (context) => _onPasswordSubmitted(),
                disabled: _isPasswordEmpty() || _validatePassword() != null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
