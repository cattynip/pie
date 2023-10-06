import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticktok/constants/gaps.dart';
import 'package:ticktok/constants/sizes.dart';
import 'package:ticktok/features/authentication/username_screen.dart';
import 'package:ticktok/features/authentication/login_screen.dart';
import 'package:ticktok/features/authentication/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTapped(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      ),
    );
  }

  void _onSignUpButtonTapped(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            children: [
              Gaps.v80,
              const Text(
                "Sign up for Ticktok",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              const Text(
                "Create a profile, follow other accounts, make your own videos, and more.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v40,
              AuthButton(
                onButtonTapped: (buttonContext) =>
                    _onSignUpButtonTapped(buttonContext),
                buttonText: "Use email & password",
                buttonIcon: const FaIcon(
                  FontAwesomeIcons.user,
                  size: Sizes.size16,
                ),
              ),
              Gaps.v16,
              AuthButton(
                onButtonTapped: (buttonContext) =>
                    _onSignUpButtonTapped(buttonContext),
                buttonText: "Continue with Apple",
                buttonIcon: const FaIcon(
                  FontAwesomeIcons.apple,
                  size: Sizes.size20,
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.5,
        color: Colors.grey.shade100,
        shadowColor: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account?"),
            Gaps.h7,
            GestureDetector(
              onTap: () => _onLoginTapped(context),
              child: Text(
                "Log in",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
