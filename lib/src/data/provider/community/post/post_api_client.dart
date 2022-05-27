import "package:dio/dio.dart";
import "package:retrofit/retrofit.dart";
import 'package:share_delivery/src/data/model/community/post/post.dart';
import 'package:share_delivery/src/data/model/community/post_detail/post_detail.dart';

part 'post_api_client.g.dart';

@RestApi(baseUrl: "http://kitcapstone.iptime.org:8080")
abstract class PostApiClient {
  factory PostApiClient(Dio dio, {String baseUrl}) = _PostApiClient;

  // 게시글 등록
  @POST("/api/posts")
  Future<Post> register(
    @Body() Post post,
  );

  // 게시글 조회
  @GET("/api/posts")
  Future<List<Post>> findAll();

  // 주제로 게시글 조회
  @GET("/api/posts")
  Future<List<Post>> findAllByCategory(
    @Query("category") String category,
  );

  // 게시글 상세정보 조회
  @GET("/api/posts/{postId}")
  Future<PostDetail> findDetailById(
    @Path() int postId,
  );

  // 게시글 수정
  @PATCH("/api/posts/{postId}")
  Future<Post> update(
    @Path() int postId,
    @Body() Post post,
  );

  // 게시글 삭제
  @DELETE("/api/posts/{postId}")
  Future<void> delete(
    @Path() int postId,
  );
}
