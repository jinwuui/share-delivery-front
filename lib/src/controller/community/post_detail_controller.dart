import 'package:get/get.dart';

class PostDetailController extends GetxController {
  List<Comment> comments = [
    Comment(
      1,
      "테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1",
      1,
      DateTime.now(),
    ),
    Comment(
      2,
      "테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1",
      1,
      DateTime.now(),
    ),
    Comment(
      3,
      "테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1",
      1,
      DateTime.now(),
    ),
    Comment(
      4,
      "테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1",
      4,
      DateTime.now(),
    ),
    Comment(
      5,
      "테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1테스트1",
      4,
      DateTime.now(),
    ),
  ];

  bool isParentComment(int idx) {
    return comments[idx].id == comments[idx].parentId;
  }

  bool isLastComment(int idx) {
    return comments.length - 1 == idx;
  }
}

class Comment {
  int id;
  String content;
  int parentId;
  DateTime createdTime;

  Comment(this.id, this.content, this.parentId, this.createdTime);
}
