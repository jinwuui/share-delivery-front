import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/data/model/community/comment/comment.dart';
import 'package:share_delivery/src/data/model/community/post/post.dart';
import 'package:share_delivery/src/data/model/community/post_detail/post_detail.dart';
import 'package:share_delivery/src/data/model/community/toggle_like_response_dto/toggle_like_response_dto.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/data/repository/community/post_detail/post_detail_repository.dart';
import 'package:share_delivery/src/utils/get_snackbar.dart';

enum PostDetailUI {
  undecided,
  writer,
  reader,
}

enum LoadingStatus {
  none,
  loading,
  complete,
  error,
}

class PostDetailController extends GetxController {
  PostDetailRepository repository;

  PostDetailController({required this.repository});

  @override
  void onInit() async {
    super.onInit();
    post = Get.arguments;
    loadingStatus.value = LoadingStatus.loading;
    await findPostDetail();
    await findComment();
    initUiType();
    loadingStatus.value = LoadingStatus.complete;
  }

  // UI 관련
  PostDetailUI uiType = PostDetailUI.undecided;
  Rx<LoadingStatus> loadingStatus = LoadingStatus.none.obs;
  int currentUserId = -1;
  RxBool onSendComment = false.obs;

  late final Post post;
  // late final Rx<PostDetail> postDetail;
  PostDetail? postDetail;
  // = PostDetasil(
  //   postId: 13,
  //   sharePlace: null,
  //   likes: 12,
  //   isLiked: true,
  //   viewCounts: 112,
  // );

  var comments = <Comment>[
    Comment(
      id: 12,
      parentId: 12,
      content: "댓글1",
      createdDateTime: DateTime.now(),
      writer: Writer(
        accountId: 13,
        nickname: "닉네임",
        mannerScore: 35.4,
      ),
      likes: 3,
      isLiked: true,
    ),
    Comment(
      id: 13,
      parentId: 12,
      content: "대댓글1",
      createdDateTime: DateTime.now(),
      writer: Writer(
        accountId: 14,
        nickname: "닉네임2",
        mannerScore: 98.3,
      ),
      likes: 7,
      isLiked: false,
    ),
  ].obs;

  TextEditingController commentTextField = TextEditingController();

  // 작성자/읽는이 UI 다르게 만들기
  void initUiType() {
    print('PostDetailController.findPostDetail');

    try {
      User user = AuthenticationController.to.state.props.first as User;

      print("게시글 상세조회 UI 타입 변경 - User : $user");

      if (user.accountId == post.writer.accountId) {
        // 글쓴이 == 사용자  --->  작성자 UI
        uiType = PostDetailUI.writer;
      } else {
        // 글쓴이 != 사용자  --->  읽는이 UI
        uiType = PostDetailUI.reader;
      }

      // 댓글의 사용자 여부 확인을 위해서 현재 유저 id 저장
      currentUserId = post.writer.accountId;
    } catch (e) {
      print("게시글 상세조회 UI 타입 변경 에러  -  $e");
    }
  }

  // 게시글 상세정보 가져오기
  Future<void> findPostDetail() async {
    postDetail = await repository.findDetailById(post.postId);

    Logger().v(postDetail);

    // postDetail.value =
    // Logger().v("게시글 상세정보 조회 ", postDetail);
  }

  // 게시글의 댓글 가져오기
  Future<void> findComment() async {
    // comments.value = await repository.findCommentById(post.postId);
    // Logger().v("게시글 상세정보 댓글 조회 ", comments);
  }

  // 게시글 삭제
  void deletePost() {
    print('PostDetailController.deletePost');

    repository.deletePost(post.postId);
  }

  // 게시글 좋아요
  Future<void> togglePostLike(int postId) async {
    PostLikeResponseDTO postLikeResponseDTO =
        await repository.togglePostLike(postId);

    if (postDetail == null) {
      await findPostDetail();
    }

    postDetail = postDetail!.copyWith(
      likes: postLikeResponseDTO.likes,
      isLiked: postLikeResponseDTO.isLiked,
    );
  }

  // 게시글 신고
  Future<void> reportPost() async {
    print('PostDetailController.reportPost - 게시글 신고');
    repository.reportPost(post.postId);
  }

  // 댓글 작성
  Future<void> sendComment([int? parentId]) async {
    if (commentTextField.text.trim().isEmpty) {
      GetSnackbar.on("알림", "공백은 댓글로 입력할 수 없습니다.");
      return;
    }

    print('PostDetailController.sendComment - 댓글 작성');

    Comment comment;
    if (parentId == null) {
      comment = await repository.sendComment(commentTextField.text);
    } else {
      comment = await repository.sendComment(commentTextField.text, parentId);
    }

    comments.add(comment);
  }

  // 댓글 수정
  Future<void> updateComment() async {
    print('PostDetailController.updateComment');
    // repository.updateComment(commentId, content);
  }

  // 댓글 삭제
  Future<void> deleteComment(int commentId) async {
    print('PostDetailController.deleteComment');
    repository.deleteComment(commentId);
  }

  // 댓글 좋아요
  Future<void> toggleCommentLike(Comment comment) async {
    CommentLikeResponseDTO commentLikeResponseDTO =
        await repository.toggleCommentLike(comment.id);

    if (postDetail == null) {
      await findPostDetail();
    }

    print('PostDetailController.toggleCommentLike');
    comment = comment.copyWith(
      likes: commentLikeResponseDTO.likes,
      isLiked: commentLikeResponseDTO.isLiked,
    );
  }

  // 댓글 신고
  Future<void> reportComment(int commentId) async {
    print('PostDetailController.reportComment - 댓글 신고');
    repository.reportComment(commentId);
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

      if (comment.createdDateTime.isAfter(cur.createdDateTime)) return false;
    }

    return true;
  }

  void setOnSendComment(bool onSendComment) {
    this.onSendComment.value = onSendComment;
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
}
