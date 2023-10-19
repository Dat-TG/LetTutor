import 'package:flutter/material.dart';
import 'package:let_tutor/common/video/controls_overlay.dart';
import 'package:video_player/video_player.dart';

class SingleVideo extends StatefulWidget {
  final String videoURL;
  const SingleVideo({super.key, required this.videoURL});

  @override
  State<SingleVideo> createState() => _SingleVideoState();
}

class _SingleVideoState extends State<SingleVideo> {
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoURL))
      ..initialize().then((value) {
        setState(() {
          controller.setVolume(1.0);
          controller.play();
        });
      });
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        controller.value.isInitialized
            ? Center(
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                  strokeWidth: 2,
                ),
              ),
        if (controller.value.isInitialized)
          ControlsOverlay(controller: controller),
      ],
    );
  }
}
