import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_delivery/src/data/model/community/post/post.dart';
import 'package:share_delivery/src/data/model/user/user_location/user_location.dart';
import 'package:share_delivery/src/data/provider/community/community_repository.dart';
import 'package:share_delivery/src/utils/get_snackbar.dart';

class CommunityController extends GetxController {
  CommunityRepository repository;

  CommunityController({required this.repository});

  // UI 관련
  Rx<RefreshController> refresher = RefreshController(initialRefresh: true).obs;

  // 게시글 관련
  var posts = <Post>[].obs;
  UserLocation? userLocation;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void onRefresh() async {
    userLocation ??= repository.getCurrentUserLocation();

    if (userLocation == null) {
      GetSnackbar.on("알림", "위치 설정을 먼저 해주세요!");
      return;
    }

    try {
      // List<Post> result = await repository.refreshPost(userLocation!);
      List<Post> result = [];
      // TODO : 임시로 해둠 = 삭제할 것
      await Future.delayed(Duration(milliseconds: 500));

      if (result.isEmpty) {
        refresher.value.loadNoData();
        GetSnackbar.on("알림", "검색된 게시글이 없습니다!");
        refresher.value.resetNoData();
        refresher.value.refreshCompleted();
        return;
      }

      posts.value = result;
      posts.add(Post(
          postCategory: '',
          content: '',
          coordinate: PostLocation(longitude: 1, latitude: 2)));

      refresher.value.resetNoData();
      refresher.value.refreshCompleted();
    } catch (e) {
      print(e);
      refresher.value.refreshFailed();
    }
  }

  void onLoading() async {
    userLocation ??= repository.getCurrentUserLocation();

    if (userLocation == null) {
      GetSnackbar.on("알림", "위치 설정을 먼저 해주세요!");
      return;
    }

    if (posts.isEmpty) {
      onRefresh();
      return;
    }

    try {
      List<Post> result = [];
      // List<Post> result = await repository.loadingPost(
      //     userLocation!, posts.last.createdDateTime);
      // TODO : 임시로 해둠 = 삭제할 것
      await Future.delayed(Duration(milliseconds: 500));

      if (result.isEmpty) {
        refresher.value.loadNoData();
        GetSnackbar.on("알림", "검색된 게시글이 없습니다!");
        return;
      }

      posts.value = result;
      posts.add(Post(
          postCategory: '',
          content: '',
          coordinate: PostLocation(longitude: 1, latitude: 2)));

      refresher.value.resetNoData();
      refresher.value.refreshCompleted();
    } catch (e) {
      print(e);
      refresher.value.refreshFailed();
    }
  }

  // Future<void> findAllPosts() async {
  //   List<Post> result = await repository.findAllPosts();
  //
  //   if (result.isEmpty) {
  //     Logger().v("게시글 없음");
  //     return;
  //   }
  //
  //   posts.value = result;
  // }
}
