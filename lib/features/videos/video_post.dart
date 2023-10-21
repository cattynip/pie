import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  final void Function() onVideoFinished;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video_1.mp4");

  void _onVideoChange() {
    final bool isVideoFinished = _videoPlayerController.value.duration ==
        _videoPlayerController.value.position;

    if (isVideoFinished) {
      widget.onVideoFinished();
    }
  }

  void _initVideoPlyerController() async {
    await _videoPlayerController.initialize();
    _videoPlayerController.play();

    _videoPlayerController.addListener(_onVideoChange);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlyerController();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.removeListener(_onVideoChange);
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: _videoPlayerController.value.isInitialized
              ? VideoPlayer(_videoPlayerController)
              : Container(
                  color: Colors.teal,
                ),
        ),
      ],
    );
  }
}
