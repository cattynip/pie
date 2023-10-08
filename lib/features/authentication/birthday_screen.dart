import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticktok/constants/gaps.dart';
import 'package:ticktok/constants/sizes.dart';
import 'package:ticktok/features/authentication/widgets/form_button.dart';
import 'package:ticktok/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdayController = TextEditingController();
  final DateTime initialDate = DateTime(DateTime.now().year);

  @override
  void initState() {
    super.initState();

    _fillBirthdayInTextInput(initialDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  String _getBirthdayInString(DateTime date) {
    return date.toString().split(" ").first;
  }

  void _fillBirthdayInTextInput(DateTime birthday) {
    _birthdayController.value =
        TextEditingValue(text: _getBirthdayInString(birthday));
  }

  void _onBirthdaySubmitted() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
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
              "When is your birthday?",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v4,
            const Text(
              "Your birthday will not be shown publicly.",
              style: TextStyle(
                fontSize: Sizes.size14,
                color: Colors.black54,
              ),
            ),
            Gaps.v16,
            TextField(
              enabled: false,
              autocorrect: false,
              controller: _birthdayController,
              onSubmitted: (value) => _onBirthdaySubmitted(),
              onEditingComplete: () => _onBirthdaySubmitted(),
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: "Birthday",
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
              disabled: false,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        height: 200,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          height: 300,
          child: CupertinoDatePicker(
            onDateTimeChanged: (value) => _fillBirthdayInTextInput(value),
            mode: CupertinoDatePickerMode.date,
            backgroundColor: Colors.white,
            minuteInterval: 60,
            initialDateTime: DateTime(
              initialDate.year - 15,
              initialDate.month,
              initialDate.day,
            ),
            maximumYear: initialDate.year,
            minimumYear: initialDate.year - 80,
            minimumDate: DateTime(
              initialDate.year - 80,
              12,
              31,
            ),
            maximumDate: DateTime(
              initialDate.year - 15,
              12,
              31,
            ),
          ),
        ),
      ),
    );
  }
}
