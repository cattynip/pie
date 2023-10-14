import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticktok/constants/gaps.dart';

class NavTab extends StatelessWidget {
  final IconData tabIcon, selectedTabIcon;
  final String tabContent;
  final bool isSelected;
  final void Function() onNavTabTapped;

  const NavTab({
    required this.tabIcon,
    required this.selectedTabIcon,
    required this.tabContent,
    required this.onNavTabTapped,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onNavTabTapped,
        behavior: HitTestBehavior.translucent,
        child: AnimatedScale(
          scale: isSelected ? 1.05 : 0.95,
          duration: const Duration(milliseconds: 200),
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.6,
            duration: const Duration(milliseconds: 150),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  isSelected ? selectedTabIcon : tabIcon,
                  color: Colors.white,
                  size: 28,
                ),
                Gaps.v5,
                Text(
                  tabContent,
                  style: const TextStyle(
                    color: Colors.white,
                    letterSpacing: 0,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
