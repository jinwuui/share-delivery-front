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
    return await apiClient.findPost(
      userLocation.latitude,
      userLocation.longitude,
      radius,
    );
  }

  Future<List<Post>> loadingPost(
      UserLocation userLocation, DateTime lastCreatedDateTime) async {
    return await apiClient.findPost(
      userLocation.latitude,
      userLocation.longitude,
      radius,
      lastCreatedDateTime.toIso8601String(),
    );
  }

  Future<List<Post>> refreshPostByCategory(
    UserLocation userLocation,
    String category,
  ) async {
    return await apiClient.findPostByCategory(
      userLocation.latitude,
      userLocation.longitude,
      radius,
      category,
    );
  }

  Future<List<Post>> loadingPostByCategory(
    UserLocation userLocation,
    String category,
    DateTime lastCreatedDateTime,
  ) async {
    return await apiClient.findPostByCategory(
      userLocation.latitude,
      userLocation.longitude,
      radius,
      category,
      lastCreatedDateTime.toIso8601String(),
    );
  }

  UserLocation? getCurrentUserLocation() {
    return localClient.findOne();
  }
}
