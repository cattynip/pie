import 'package:flutter/material.dart';
import 'package:ticktok/constants/sizes.dart';
import 'package:ticktok/features/authentication/password_screen.dart';
import 'package:ticktok/features/authentication/widgets/form_button.dart';
import 'package:ticktok/features/authentication/widgets/form_input.dart';
import 'package:ticktok/features/authentication/widgets/instruction.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  String _email = "";

  @override
  void initState() {
    super.initState();

    _emailController.addListener(() {
      setState(() {
        _email = _emailController.value.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onScaffoldTapped() {
    FocusScope.of(context).unfocus();
  }

  void _onEmailSubmitted() {
    if (_isEmailEmpty() || _validateEmail() != null) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  String? _validateEmail() {
    if (_isEmailEmpty()) return null;

    final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    final bool isEmailValid = regExp.hasMatch(_email);
    if (!isEmailValid) return "Email is not valid.";

    return null;
  }

  bool _isEmailEmpty() {
    return _email.isEmpty;
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
                title: "What's your email?",
                description:
                    "You can get notifications, new ticktoks, and more.",
              ),
              FormInput(
                hintText: "Email",
                inputController: _emailController,
                onSubmitted: _onEmailSubmitted,
                validation: _validateEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              FormButton(
                onButtonTapped: (context) => _onEmailSubmitted(),
                disabled: _isEmailEmpty() || _validateEmail() != null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
