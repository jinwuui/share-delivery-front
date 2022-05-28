import 'package:get/get.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/data/model/community/post_detail/post_detail.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
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
  void onInit() async {
    super.onInit();
    await findPostDetail();
    initUiType();
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

  // 작성자/읽는이 UI 다르게 만들기
  void initUiType() {
    print('PostDetailController.findPostDetail');

    try {
      User user = Get.find<AuthenticationController>().state.props as User;

      if (user.accountId == post!.writer.id) {
        // 글쓴이 == 사용자  --->  작성자 UI
        uiType = PostDetailUI.writer;
      } else {
        // 글쓴이 != 사용자  --->  읽는이 UI
        uiType = PostDetailUI.reader;
      }
    } catch (e) {
      print("게시글 상세조회 UI 타입 변경 에러  -  $e");
    }
  }

  // 게시글 상세정보 가져오기
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
