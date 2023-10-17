import 'package:flutter/material.dart';
import 'package:ticktok/constants/sizes.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 6;
  final PageController _pageController = PageController();

  final List<Color> colorList = [
    Colors.brown,
    Colors.cyan,
    Colors.blue,
    Colors.pink,
    Colors.teal,
    Colors.yellow,
  ];

  final List<Color> addedColorList = [
    Colors.black,
    Colors.lime,
    Colors.amber,
    Colors.green,
    Colors.red,
  ];

  void _onVideoTimelinePageChanged(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 150),
      curve: Curves.ease,
    );

    final shouldBeRefreshed = pageIndex == _itemCount - 1;
    if (shouldBeRefreshed) {
      setState(() {
        _itemCount += addedColorList.length;
      });
      colorList.addAll(addedColorList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: _onVideoTimelinePageChanged,
      itemCount: _itemCount,
      itemBuilder: (context, index) {
        return Container(
          color: colorList[index],
          child: Center(
            child: Text(
              "Video number $index",
              style: const TextStyle(
                color: Colors.white,
                fontSize: Sizes.size32,
              ),
            ),
          ),
        );
      },
    );
  }
}
