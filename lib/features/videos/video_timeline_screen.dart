import 'package:flutter/material.dart';
import 'package:ticktok/features/videos/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();
  final Duration _videoAnimationDuration = const Duration(milliseconds: 150);
  final Curve _videoAnimationCurve = Curves.ease;
  int _itemCount = 6;

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
      duration: _videoAnimationDuration,
      curve: _videoAnimationCurve,
    );

    final shouldBeRefreshed = pageIndex == _itemCount - 1;
    if (shouldBeRefreshed) {
      setState(() {
        _itemCount += addedColorList.length;
      });
      colorList.addAll(addedColorList);
    }
  }

  void _onVideoFinished() {
    _pageController.nextPage(
      duration: _videoAnimationDuration,
      curve: _videoAnimationCurve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      onPageChanged: _onVideoTimelinePageChanged,
      itemCount: _itemCount,
      itemBuilder: (context, index) {
        return VideoPost(
          onVideoFinished: _onVideoFinished,
        );
      },
    );
  }
}
