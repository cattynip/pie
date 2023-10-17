import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ticktok/constants/gaps.dart';
import 'package:ticktok/features/main_navigation/widgets/nav_tab.dart';
import 'package:ticktok/features/main_navigation/widgets/post_video_button.dart';
import 'package:ticktok/features/videos/video_timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIdx = 0;

  void _onBottomNavBarItemTapped(int index) {
    setState(() {
      _selectedIdx = index;
    });
  }

  void _onPostVideoButtonTapped() {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text("Record your video."),
          ),
          body: const Text("Hello!"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIdx != 0,
            child: const VideoTimelineScreen(),
          ),
          Offstage(
            offstage: _selectedIdx != 1,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIdx != 3,
            child: Container(),
          ),
          Offstage(
            offstage: _selectedIdx != 4,
            child: Container(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Gaps.h24,
            PostVideoButton(onPostVideoButtonTapped: _onPostVideoButtonTapped),
            Gaps.h24,
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
