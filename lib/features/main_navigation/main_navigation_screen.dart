import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticktok/features/main_navigation/stf_screen.dart';
import 'package:ticktok/features/main_navigation/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIdx = 0;

  // If the elements of this list were the same widgets,
  // they would have shared the same variables, which means you have to add GlobalKey thing to identify what widget is what.
  // However, if you add that property, they will be disposed and re-rendered every time the user moves between the pages.
  // Which means they will no longer save the data when the user escapes from that page because that page will be disposed and the data in that page will also be disposed.:wq

  void _onBottomNavBarItemTapped(int index) {
    setState(() {
      _selectedIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIdx != 0,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIdx != 1,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIdx != 3,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIdx != 4,
            child: const StfScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavTab(
              tabIcon: FontAwesomeIcons.house,
              selectedTabIcon: FontAwesomeIcons.house,
              tabContent: "Home",
              isSelected: _selectedIdx == 0,
              onNavTabTapped: () => _onBottomNavBarItemTapped(0),
            ),
            NavTab(
              tabIcon: FontAwesomeIcons.compass,
              selectedTabIcon: FontAwesomeIcons.solidCompass,
              tabContent: "Discover",
              isSelected: _selectedIdx == 1,
              onNavTabTapped: () => _onBottomNavBarItemTapped(1),
            ),
            NavTab(
              tabIcon: FontAwesomeIcons.message,
              selectedTabIcon: FontAwesomeIcons.solidMessage,
              tabContent: "Inbox",
              isSelected: _selectedIdx == 3,
              onNavTabTapped: () => _onBottomNavBarItemTapped(3),
            ),
            NavTab(
              tabIcon: FontAwesomeIcons.user,
              selectedTabIcon: FontAwesomeIcons.solidUser,
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
