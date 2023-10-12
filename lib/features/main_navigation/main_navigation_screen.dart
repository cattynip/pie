import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  void _onBottomNavigationBarItemTapped(int index) {
    setState(() {
      _selectedIdx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIdx],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIdx,
        onDestinationSelected: _onBottomNavigationBarItemTapped,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        backgroundColor: Colors.white,
        indicatorColor: Colors.deepPurple.shade200,
        surfaceTintColor: Colors.amber,
        destinations: const [
          NavigationDestination(
            icon: FaIcon(
              FontAwesomeIcons.house,
              color: Colors.black,
            ),
            label: "Home",
            tooltip: "Go to home",
          ),
          NavigationDestination(
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.black,
            ),
            label: "Search",
            tooltip: "Search some terms",
          ),
        ],
      ),
    );
  }
}
