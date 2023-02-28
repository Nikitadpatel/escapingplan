


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';

class addVideo extends StatefulWidget {
  var videoid;
  addVideo({required this.videoid});
  @override
  State<addVideo> createState() => _addVideoState();
}

class _addVideoState extends State<addVideo> {
  late VideoPlayerController _controller;
  bool isPlay=false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoid);
    _controller.addListener(() {
      if (!_controller.value.isPlaying &&
          _controller.value.isInitialized &&
          (_controller.value.duration == _controller.value.position)) {
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => ExplorerScreen(),
        //     ));
        // _controller.dispose();
      }
    });
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
//
    _controller.setLooping(false);
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          VideoPlayer(_controller!),
          Align(
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {
                if (isPlay) {
                  _controller!.pause();
                } else {
                  _controller!.play();
                }

                setState(() {
                  isPlay = !isPlay;
                });
              },
              icon: Icon(
                isPlay ? Icons.pause_circle : Icons.play_circle,
              ),
            ),
          ),
        ],
      ),
    );;

  }
}
