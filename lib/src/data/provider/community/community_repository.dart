import 'package:share_delivery/src/data/model/community/post/post.dart';
import 'package:share_delivery/src/data/model/user/user_location/user_location.dart';
import 'package:share_delivery/src/data/provider/community/post/community_api_client.dart';
import 'package:share_delivery/src/data/provider/widgets/user_location_local_client.dart';

class CommunityRepository {
  CommunityApiClient apiClient;
  UserLocationLocalClient localClient;
  static const radius = 5;

  CommunityRepository({required this.apiClient, required this.localClient});

  Future<List<Post>> refreshPost(UserLocation userLocation) async {
    // List<Post> result = [];
    // result = await apiClient.findPost();
    // return result;
    // TODO : 노션에 API 쿼리스트링 참고해서 주입하기

    return await apiClient.findPost(
      userLocation.latitude,
      userLocation.longitude,
      5,
    );
  }

  Future<List<Post>> loadingPost(
      UserLocation userLocation, DateTime lastCreatedDateTime) async {
    // TODO : 노션에 API 쿼리스트링 참고해서 주입하기

    return await apiClient.findPost(
      userLocation.latitude,
      userLocation.longitude,
      5,
      lastCreatedDateTime.toIso8601String(),
    );
  }

  UserLocation? getCurrentUserLocation() {
    return localClient.findOne();
  }
}
