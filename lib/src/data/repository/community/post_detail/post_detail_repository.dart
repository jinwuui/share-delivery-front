import 'package:share_delivery/src/data/model/community/post_detail/post_detail.dart';
import 'package:share_delivery/src/data/provider/community/post/community_api_client.dart';

class PostDetailRepository {
  CommunityApiClient apiClient;

  PostDetailRepository({required this.apiClient});

  Future<PostDetail> findDetailById(int postId) async {
    return await apiClient.findPostDetailById(postId);
  }

  Future<void> deletePost(int postId) async {
    print('PostDetailRepository.deletePost');
    await apiClient.deletePost(postId);
  }
}
