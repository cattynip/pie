import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticktok/constants/months.dart';
import 'package:ticktok/constants/sizes.dart';
import 'package:ticktok/features/authentication/widgets/form_button.dart';
import 'package:ticktok/features/authentication/widgets/form_input.dart';
import 'package:ticktok/features/authentication/widgets/instruction.dart';
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

  void _onScaffoldTapped() {
    FocusScope.of(context).unfocus();
  }

  String _getBirthdayInString(DateTime date) {
    return "${Months.convertFromNumberToString(date.month)} ${date.day}, ${date.year}";
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
                title: "When's your birthday?",
                description: "Your birthday will not be shown publicly.",
              ),
              FormInput(
                hintText: "Birthday",
                inputController: _birthdayController,
                onSubmitted: _onBirthdaySubmitted,
                validation: () {
                  return null;
                },
              ),
              FormButton(
                onButtonTapped: (context) => _onBirthdaySubmitted(),
                disabled: false,
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 240,
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
      ),
    );
  }
}
