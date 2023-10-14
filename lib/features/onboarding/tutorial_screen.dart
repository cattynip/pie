import 'package:flutter/material.dart';
import 'package:ticktok/constants/sizes.dart';
import 'package:ticktok/features/main_navigation/main_navigation_screen.dart';
import 'package:ticktok/features/onboarding/widgets/bottom_button.dart';
import 'package:ticktok/features/onboarding/widgets/tutorial_piece.dart';

enum Direction {
  right,
  left,
}

enum Page {
  first,
  second,
}

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  void _onPanUpdated(DragUpdateDetails details) {
    final bool scrollingToRight = details.delta.dx > 0;
    if (scrollingToRight) {
      setState(() {
        _direction = Direction.right;
      });
    } else {
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnded(DragEndDetails details) {
    final bool isStrongEnough = details.velocity.pixelsPerSecond.dx.abs() > 500;
    if (!isStrongEnough) return;

    if (_direction == Direction.right) {
      setState(() {
        _showingPage = Page.first;
      });
    }

    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    }
  }

  void _onNextButtonTapped() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const MainNavigationScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdated,
      onPanEnd: _onPanEnded,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size24,
              vertical: Sizes.size32,
            ),
            child: AnimatedCrossFade(
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 150),
              firstChild: const TutorialPiece(
                title: "Swip Up!",
                descrition:
                    "Videos are personalized for you based on what you watch, like and share.",
              ),
              secondChild: const TutorialPiece(
                title: "Follow the Rules!",
                descrition: "Take care of one another! Please!",
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: _showingPage == Page.first ? 0 : 1,
            child: BottomButton(
              content: "Dive into the App!",
              isActive: true,
              onButtonTapped: _onNextButtonTapped,
            ),
          ),
        ),
      ),
    );
  }
}
