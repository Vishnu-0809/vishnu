import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({
    Key? key,
    required this.url,
    required this.dataSourceType,
  }) : super(key: key);

  final String url;
  final DataSourceType dataSourceType;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController videoPlayerController;

  late ChewieController chewieController = ChewieController(
    videoPlayerController: VideoPlayerController.network(''), // Initial value, will be updated in initState
    aspectRatio: 16 / 9,
  );

  bool value = false;

  @override
  void initState() {
    super.initState();

    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        videoPlayerController = VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.network:
        videoPlayerController = VideoPlayerController.network(widget.url);
        break;
      case DataSourceType.file:
        videoPlayerController = VideoPlayerController.file(File(widget.url));
        break;
      case DataSourceType.contentUri:
        videoPlayerController =
            VideoPlayerController.contentUri(Uri.parse(widget.url));
        break;
    }

      videoPlayerController.initialize().then(
          (_){setState(
            () =>  chewieController = ChewieController(
              videoPlayerController: videoPlayerController,
              aspectRatio: 16 / 9,
            ),
              
          );}

          
        );

    print(
        "gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg");
    print(value);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Chewie(controller: chewieController),
      ),
    );
  }
}
