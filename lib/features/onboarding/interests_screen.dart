import 'package:flutter/material.dart';
import 'package:ticktok/constants/gaps.dart';
import 'package:ticktok/constants/sizes.dart';
import 'package:ticktok/features/onboarding/widgets/bottom_button.dart';
import 'package:ticktok/features/onboarding/widgets/interest_button.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isTitleVisible = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final bool shouldTitleBeShown = _scrollController.offset > 110;

      if (shouldTitleBeShown) {
        if (isTitleVisible) return;

        setState(() {
          isTitleVisible = true;
        });
      } else {
        if (!isTitleVisible) return;

        setState(() {
          isTitleVisible = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          opacity: isTitleVisible ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: const Text("Choose your interests"),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v10,
              const Text(
                "Choose your interests",
                style: TextStyle(
                  fontSize: Sizes.size36,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  letterSpacing: 0.5,
                ),
              ),
              Gaps.v8,
              const Text(
                "Get better video recommendations.",
                style: TextStyle(
                  fontSize: Sizes.size16 + Sizes.size2,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Gaps.v44,
              Wrap(
                spacing: 12,
                runSpacing: 20,
                children: [
                  for (var interest in interests)
                    InterestButton(interest: interest)
                ],
              ),
              Gaps.v20
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // height: Sizes.size96,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
            vertical: Sizes.size4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomButton(
                content: "Skip",
                isActive: false,
                onButtonTapped: () {},
              ),
              Gaps.h14,
              BottomButton(
                content: "Next",
                isActive: true,
                onButtonTapped: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
