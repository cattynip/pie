import 'package:flutter/material.dart';
import 'package:ticktok/constants/gaps.dart';
import 'package:ticktok/constants/sizes.dart';
import 'package:ticktok/features/authentication/password_screen.dart';
import 'package:ticktok/features/authentication/widgets/form_button.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();
  String _birthday = "";

  @override
  void initState() {
    super.initState();

    _birthdayController.addListener(() {
      setState(() {
        _birthday = _birthdayController.text;
      });
    });
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _onScaffoldTapped() {
    FocusScope.of(context).unfocus();
  }

  void _onBirthdaySubmitted() {
    if (_isBirthdayEmpty() || _isBirthdayValid() != null) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  bool _isBirthdayEmpty() {
    return _birthday.isEmpty;
  }

  String? _isBirthdayValid() {
    if (_isBirthdayEmpty()) return null;

    final regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    final bool isBirthdayValid = regExp.hasMatch(_birthday);
    if (!isBirthdayValid) return "Birthday is not valid.";

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
                "What is your birthday?",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v4,
              const Text(
                "You can get notifications, new ticktoks, and more.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black54,
                ),
              ),
              Gaps.v16,
              TextField(
                autocorrect: false,
                controller: _birthdayController,
                onSubmitted: (value) => _onBirthdaySubmitted(),
                onEditingComplete: () => _onBirthdaySubmitted(),
                decoration: InputDecoration(
                  hintText: "Birthday",
                  errorText: _isBirthdayValid(),
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
              Gaps.v16,
              FormButton(
                onButtonTapped: (context) => _onBirthdaySubmitted(),
                disabled: _isBirthdayEmpty() || _isBirthdayValid() != null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
