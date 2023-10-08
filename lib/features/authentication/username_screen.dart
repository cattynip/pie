import 'package:flutter/material.dart';
import 'package:ticktok/constants/sizes.dart';
import 'package:ticktok/features/authentication/email_screen.dart';
import 'package:ticktok/features/authentication/widgets/form_button.dart';
import 'package:ticktok/features/authentication/widgets/form_input.dart';
import 'package:ticktok/features/authentication/widgets/instruction.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  String _username = "";

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.value.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _onScaffoldTapped() {
    FocusScope.of(context).unfocus();
  }

  void _onUsernameSubmitted() {
    if (_isUsernameEmpty() || _validateUsername() != null) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ),
    );
  }

  String? _validateUsername() {
    if (_isUsernameEmpty()) return null;

    final isUsernameShort = _username.length < 5;
    if (isUsernameShort) return "Username is too short.";

    final isUsernameLong = _username.length > 25;
    if (isUsernameLong) return "Username is too long.";

    final regExp = RegExp(r"^(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$");
    final bool isUsernameValid = regExp.hasMatch(_username);
    if (!isUsernameValid) return "Username is not valid.";

    return null;
  }

  bool _isUsernameEmpty() {
    return _username.isEmpty;
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
                title: "Create username",
                description: "You can always change this later.",
              ),
              FormInput(
                hintText: "Username",
                inputController: _usernameController,
                onSubmitted: _onUsernameSubmitted,
                validation: _validateUsername,
              ),
              FormButton(
                onButtonTapped: (context) => _onUsernameSubmitted(),
                disabled: _isUsernameEmpty() || _validateUsername() != null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
