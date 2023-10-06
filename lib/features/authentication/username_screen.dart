import 'package:flutter/material.dart';
import 'package:ticktok/constants/gaps.dart';
import 'package:ticktok/constants/sizes.dart';
import 'package:ticktok/features/authentication/email_screen.dart';
import 'package:ticktok/features/authentication/widgets/form_button.dart';

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
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _onUsernameSubmitted() {
    if (_isUsernameEmpty() || _isUsernameValid() != null) return;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const EmailScreen(),
    ));
  }

  bool _isUsernameEmpty() {
    return _username.isEmpty;
  }

  String? _isUsernameValid() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Create username",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v4,
            const Text(
              "You can always change this later.",
              style: TextStyle(
                fontSize: Sizes.size16,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              keyboardType: TextInputType.text,
              autocorrect: false,
              controller: _usernameController,
              onSubmitted: (value) => _onUsernameSubmitted(),
              onEditingComplete: () => _onUsernameSubmitted(),
              decoration: InputDecoration(
                hintText: "Username",
                errorText: _isUsernameValid(),
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
              onButtonTapped: (context) => _onUsernameSubmitted(),
              disabled: _isUsernameEmpty() || _isUsernameValid() != null,
            )
          ],
        ),
      ),
    );
  }
}
