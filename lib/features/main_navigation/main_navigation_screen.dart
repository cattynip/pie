import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticktok/constants/gaps.dart';
import 'package:ticktok/features/main_navigation/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIdx = 0;

  final List<Widget> screens = [
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("Search"),
    ),
    const Center(
      child: Text("Settings"),
    ),
  ];

  void _onBottomNavBarItemTapped(int index) {
    setState(() {
      _selectedIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Cupertino? Terrible.
    // To be honest, I planned to use Cupertino for the next project because I love the unique styling and designs of Apple, but I just realized that Flutter was built by Google.
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavTab(
              tabIcon: FontAwesomeIcons.house,
              tabContent: "Home",
              isSelected: _selectedIdx == 0,
              onNavTabTapped: () => _onBottomNavBarItemTapped(0),
            ),
            NavTab(
              tabIcon: FontAwesomeIcons.magnifyingGlass,
              tabContent: "Discover",
              isSelected: _selectedIdx == 1,
              onNavTabTapped: () => _onBottomNavBarItemTapped(1),
            ),
            NavTab(
              tabIcon: FontAwesomeIcons.plus,
              tabContent: "Home",
              isSelected: false,
              onNavTabTapped: () => {},
            ),
            NavTab(
              tabIcon: FontAwesomeIcons.inbox,
              tabContent: "Inbox",
              isSelected: _selectedIdx == 3,
              onNavTabTapped: () => _onBottomNavBarItemTapped(3),
            ),
            NavTab(
              tabIcon: FontAwesomeIcons.user,
              tabContent: "Profile",
              isSelected: _selectedIdx == 4,
              onNavTabTapped: () => _onBottomNavBarItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}
