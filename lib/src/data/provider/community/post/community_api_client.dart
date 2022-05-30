import "package:dio/dio.dart";
import "package:retrofit/retrofit.dart";
import 'package:share_delivery/src/data/model/community/post/post.dart';
import 'package:share_delivery/src/data/model/community/post_detail/post_detail.dart';

part 'community_api_client.g.dart';

@RestApi(baseUrl: "http://kitcapstone.iptime.org:8080")
abstract class CommunityApiClient {
  factory CommunityApiClient(Dio dio, {String baseUrl}) = _CommunityApiClient;

  // 게시글 등록
  @POST("/api/posts")
  Future<Post> registerPost(
    @Body() Post post,
  );

  // 게시글 조회
  @GET("/api/posts")
  Future<List<Post>> findPost(@Query("lat") double lat,
      @Query("lng") double lng, @Query("radius") int radius,
      [@Query("lastCreatedDate") String? lastCreatedDate]);

  // 주제로 게시글 조회
  @GET("/api/posts")
  Future<List<Post>> findPostByCategory(
    @Query("category") String category,
  );

  // 게시글 상세정보 조회
  @GET("/api/posts/{postId}")
  Future<PostDetail> findPostDetailById(
    @Path() int postId,
  );

  // 게시글 수정
  @PATCH("/api/posts/{postId}")
  Future<Post> updatePost(
    @Path() int postId,
    @Body() Post post,
  );

  // 게시글 삭제
  @DELETE("/api/posts/{postId}")
  Future<void> deletePost(
    @Path() int postId,
  );

  // 댓글 등록
  @POST("/api/comments")
  Future<Comment> registerComment(
    @Body() Comment comment,
  );

  // 댓글 조회
  @GET("/api/comments/{postId}")
  Future<List<Comment>> findComment(
    @Query("postId") int postId,
  );

  // 댓글 수정
  @GET("/api/comments/{commentId}")
  Future<Comment> updateComment(
    @Query("commentId") int commentId,
    @Body() String content,
  );

  // 댓글 삭제
  @DELETE("/api/comments/{commentId}")
  Future<void> deleteComment(
    @Query("commentId") int commentId,
  );
}
