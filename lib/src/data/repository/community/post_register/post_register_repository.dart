import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/model/community/post/post.dart';
import 'package:share_delivery/src/data/model/user/user_location/user_location.dart';
import 'package:share_delivery/src/data/provider/community/post/community_api_client.dart';
import 'package:share_delivery/src/data/provider/widgets/user_location_local_client.dart';

class PostRegisterRepository {
  CommunityApiClient apiClient;
  UserLocationLocalClient userLocationLocalClient;

  PostRegisterRepository({
    required this.apiClient,
    required this.userLocationLocalClient,
  });

  Future<Post?> registerPost(
    UserLocation userLocation,
    String content,
    String postCategory,
  ) async {
    // 글 작성 위치 == 사용자 위치
    PostLocation coordinate = PostLocation(
      latitude: userLocation.latitude,
      longitude: userLocation.longitude,
    );

    // 작성할 글
    Post post = Post(
      content: content,
      postCategory: postCategory,
      coordinate: coordinate,
    );

    // 글 작성 요청
    await apiClient.registerPost(post).then((it) {
      Logger().i(it);
      return it;
    }).catchError((err) {
      Logger().e(err);
    });

    return null;
  }

  UserLocation? getUserLocation() {
    return userLocationLocalClient.findOne();
  }
}
