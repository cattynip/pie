import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticktok/constants/gaps.dart';
import 'package:ticktok/constants/sizes.dart';
import 'package:ticktok/features/authentication/birthday_screen.dart';
import 'package:ticktok/features/authentication/widgets/form_button.dart';

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
        _password = _passwordController.text;
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

  void _onDeleteButtonTapped() {
    _passwordController.clear();
  }

  void _onHidingToggleButtonTapped() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  void _onPasswordSubmitted() {
    if (_isPasswordEmpty() || _isPasswordValid() != null) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
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

  bool _isPasswordValidOnRegExp() {
    return RegExp(
      r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[@$!%*#?&\^])[A-Za-z0-9@$!%*#?&\^]{9,}$",
    ).hasMatch(_password);
  }

  String? _isPasswordValid() {
    if (_isPasswordEmpty()) return null;

    if (_isPasswordShort()) return "Password is short.";
    if (_isPasswordLong()) return "Password is long.";
    if (!_isPasswordValidOnRegExp()) return "Password is not valid.";

    return null;
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
              const Text(
                "Create password",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v4,
              const Text(
                "You can safe your account and data in TickTok, and more.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black54,
                ),
              ),
              Gaps.v16,
              TextField(
                keyboardType: TextInputType.visiblePassword,
                autocorrect: false,
                controller: _passwordController,
                onSubmitted: (value) => _onPasswordSubmitted(),
                onEditingComplete: () => _onPasswordSubmitted(),
                obscureText: _hidePassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  errorText: _isPasswordValid(),
                  suffix: Row(
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
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.circleCheck,
                        size: 18,
                        color: _isPasswordShort() ^ _isPasswordLong()
                            ? Colors.red.shade600
                            : Colors.green.shade500,
                      ),
                      Gaps.h5,
                      const Text("8 to 20 characters")
                    ],
                  ),
                  Gaps.v3,
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.circleCheck,
                        size: 18,
                        color: !_isPasswordValidOnRegExp()
                            ? Colors.red.shade600
                            : Colors.green.shade500,
                      ),
                      Gaps.h5,
                      const Text("Letters, numbers, and special characters")
                    ],
                  ),
                ],
              ),
              Gaps.v44,
              FormButton(
                onButtonTapped: (context) => _onPasswordSubmitted(),
                disabled: _isPasswordEmpty() || _isPasswordValid() != null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
