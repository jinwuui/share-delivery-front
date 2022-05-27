import 'package:get/get.dart';
import 'package:share_delivery/src/data/model/community/post_detail/post_detail.dart';
import 'package:share_delivery/src/data/repository/community/post_detail/post_detail_repository.dart';

enum PostDetailUI {
  undecided,
  writer,
  reader,
}

class PostDetailController extends GetxController {
  PostDetailRepository repository;

  PostDetailController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    initUiType();
    findPostDetail();
  }

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

  PostDetailUI uiType = PostDetailUI.undecided;

  PostDetail? post;

  void initUiType() {
    print('PostDetailController.findPostDetail');
    print(Get.arguments["userId"]);
    // TODO : 사용자 ID 와 post 의 글쓴이 ID 비교해서 같으면 writer, 다르면 reader
  }

  Future<void> findPostDetail() async {
    print('PostDetailController.findPostDetail - 게시글 상세조회');
    print("postId: ${Get.arguments["postId"]}");

    // TODO : postId 로 게시글 상세조회
    int postId = Get.arguments["postId"];
    post = await repository.findDetailById(postId);
  }

  bool isParentComment(int idx) {
    return comments[idx].id == comments[idx].parentId;
  }

  bool isLastComment(int idx) {
    return comments.length - 1 == idx;
  }

  bool onWriteCommentBar(Comment cur) {
    // Comment cur = comments[idx];

    if (cur.id == cur.parentId) return false;

    int parentId = cur.parentId;

    for (Comment comment in comments) {
      if (comment.parentId != parentId || comment.id == cur.id) continue;

      if (comment.createdTime.isAfter(cur.createdTime)) return false;
    }

    return true;
  }

  List<Comment> getCommentGroup(int parentId) {
    List<Comment> list = [];

    for (Comment comment in comments) {
      if (comment.parentId == parentId) {
        list.add(comment);
      }
    }

    return list;
  }

  // 게시글 삭제
  void deletePost() {
    print('PostDetailController.deletePost');
    if (post == null) return;

    repository.deletePost(post!.postId);
  }

  // 게시글 수정
  void updatePost() {
    print('PostDetailController.updatePost');
    if (post == null) return;

    // repository.updatePost(postId);
  }
}

class Comment {
  int id;
  String content;
  int parentId;
  DateTime createdTime;

  Comment(this.id, this.content, this.parentId, this.createdTime);
}
