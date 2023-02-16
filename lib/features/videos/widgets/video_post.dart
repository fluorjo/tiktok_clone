import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video.mp4");


void _onVideoChange(){
if(_videoPlayerController.value.isInitialized){
  if (
    //영상 길이가 10초고, 현재 사용자의 영상 내 위치가 10초이면 영상이 끝난 걸로 본다. 
    _videoPlayerController.value.duration ==_videoPlayerController.value.position
  ) {
    
    widget.onVideoFinished();
  }
}
}

  void _initVideoPlayer() async {
    //1단계:초기화.
    await _videoPlayerController.initialize();

    _videoPlayerController.play();
    setState(() {});
    _videoPlayerController.addListener(_onVideoChange );
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
//statefulwidget의 프로퍼티를 state에서 접근.
    widget.onVideoFinished();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //fill = 화면 전체를 채우는 위젯 만들 때 사용.
        Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ))
      ],
    );
  }
}
