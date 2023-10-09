import 'package:flutter/material.dart';
import 'package:ticktok/constants/gaps.dart';
import 'package:ticktok/constants/sizes.dart';
import 'package:ticktok/features/authentication/widgets/form_button.dart';

class LogInFormScreen extends StatefulWidget {
  const LogInFormScreen({super.key});

  @override
  State<LogInFormScreen> createState() => _LogInFormScreenState();
}

class _LogInFormScreenState extends State<LogInFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  void _onSubmitButtonTapped(BuildContext context) {
    final bool doesCurrentStateExist = _formKey.currentState != null;
    if (doesCurrentStateExist) {
      final bool isFormValidated = _formKey.currentState!.validate();
      if (isFormValidated) {
        _formKey.currentState!.save();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log In"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Gaps.v28,
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                validator: (value) {
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    formData["email"] = newValue;
                  }
                },
              ),
              Gaps.v16,
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                validator: (value) {
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    formData["password"] = newValue;
                  }
                },
              ),
              Gaps.v28,
              FormButton(
                disabled: false,
                onButtonTapped: _onSubmitButtonTapped,
                buttonText: "Log In",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
