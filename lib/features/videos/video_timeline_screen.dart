import 'package:flutter/material.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({super.key});

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  //값이 변할 거기 때문에 final로 안 함.
  int _itemCount = 4;
  final PageController _pageController = PageController();
  final Duration _scrollDuration = const Duration(milliseconds: 10);
  final Curve _scrollCurve = Curves.linear;

  void _onPageChanged(int page) {
    _pageController.animateToPage(
      page,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
    if (page == _itemCount - 1) {
      _itemCount = _itemCount + 4;
      setState(() {});
    }
  }
//영상 끝난 뒤 다음 영상 바로 재생
  // void _onVideoFinished() {
  //   _pageController.nextPage(
  //     duration: _scrollDuration,
  //     curve: _scrollCurve,
  //   );
  //  }

//영상 끝난 뒤 정지
  // void _onVideoFinished() {
  //   return;
  // }

// 영상 끝난 뒤 반복재생
  void _onVideoFinished() {
    _pageController.nextPage(
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    //Future.delayed = future가 있는 것처럼 하는 것.
    return Future.delayed(
      const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      //위치 설정
      displacement: 40,
      edgeOffset: 10,

      color: Theme.of(context).primaryColor,
      strokeWidth: 3,

      //화면을 당길 때 실행되는 callback.
      //★★★ 반드시 future를 반환해야 한다. async 쓰거나.
      onRefresh: _onRefresh,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        itemCount: _itemCount,
        itemBuilder: (context, index) =>
            VideoPost(onVideoFinished: _onVideoFinished, index: index),
        //함수를 video post로 넘겨줌. 근데 stateful에 넘겨주는 거지 state한테 가는 게 아님.
      ),
    );
  }
}
