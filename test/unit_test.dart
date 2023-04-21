// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:tiktok_clone/features/videos/models/video_model.dart';

void main() {
  group("video model test", () {
    test("Constructor", () {
      final video = VideoModel(
        id: "id",
        description: "description",
        fileUrl: "fileUrl",
        thumbnailUrl: "thumbnailUrl",
        creatorUid: "creatorUid",
        likes: 1,
        comments: 1,
        createdAt: 1,
        title: "title",
        creator: "creator",
      );
      expect(video.id, "id");
    });

    test(".fromjson Constructor", () {
      final video = VideoModel.fromJson(
        json: {
          'description': "description",
          'fileUrl': "fileUrl",
          'thumbnailUrl': "thumbnailUrl",
          'creatorUid': "creatorUid",
          'likes': 1,
          'comments': 1,
          'createdAt': 1,
          'title': "title",
          'creator': "creator",
          'id': "id",
        },
        videoId: "videoId",
      );
      expect(video.title, "title");
      expect(video.comments, isInstanceOf<int>());
    });
    test(".tojson Method", () {
      final video = VideoModel(
        id: "id",
        description: "description",
        fileUrl: "fileUrl",
        thumbnailUrl: "thumbnailUrl",
        creatorUid: "creatorUid",
        likes: 1,
        comments: 1,
        createdAt: 1,
        title: "title",
        creator: "creator",
      );
      final json = video.toJson();
      expect(json["id"], "id");
      expect(json["likes"], isInstanceOf<int>());
    });
  });
}
