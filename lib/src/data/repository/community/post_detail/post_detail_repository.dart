import 'package:share_delivery/src/data/model/community/post_detail/post_detail.dart';
import 'package:share_delivery/src/data/provider/community/post/post_api_client.dart';

class PostDetailRepository {
  PostApiClient apiClient;

  PostDetailRepository({required this.apiClient});

  Future<PostDetail> findDetailById(int postId) async {
    print('PostDetailRepository.findDetailById');
    return await apiClient.findDetailById(postId);
  }

  Future<void> deletePost(int postId) async {
    print('PostDetailRepository.deletePost');
    await apiClient.delete(postId);
  }
}
