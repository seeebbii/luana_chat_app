import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPreview extends StatefulWidget {
  VideoPreview({
    this.videoPlayerController,
    this.looping,
    this.autoplay,
    Key? key,
  }) : super(key: key);

  final VideoPlayerController? videoPlayerController;
  final bool? looping;
  final bool? autoplay;

  @override
  _VideoPreviewState createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  ChewieController? _chewieController;

  @override
  void initState() {
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController!,
      aspectRatio: 6 / 9,
      autoInitialize: true,
      autoPlay: widget.autoplay!,
      looping: widget.looping!,
      showControls: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
        quarterTurns: 3, child: Chewie(controller: _chewieController!));
  }
}
