import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoViewer extends StatefulWidget {
  const VideoViewer({
    super.key,
    this.controller,
  });

  final VideoPlayerController? controller;

  @override
  State<VideoViewer> createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer> {
  late final VideoPlayerController _controller =
      widget.controller ??
      VideoPlayerController.asset("assets/videos/sample.mp4");

  @override
  void initState() {
    super.initState();
    _controller.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
  }
}
