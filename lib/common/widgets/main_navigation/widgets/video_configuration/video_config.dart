import 'package:flutter/material.dart';

class VideoConfig extends InheritedWidget {
  //InheritedWidget를 쓰고 이걸 extends할 때는 child가 필요하다. 중요!
  const VideoConfig({super.key, required super.child});

  final bool autoMute = false;
  static VideoConfig of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<VideoConfig>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
