import 'dart:io';

import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/model/community/post/post.dart';
import 'package:share_delivery/src/data/model/community/post_register_request_dto/post_register_request_dto.dart';
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
    String category,
    List<String> images,
  ) async {
    // TODO: 위치 공유 넣기

    // 글 작성 위치 == 사용자 위치
    PostLocation coordinate = PostLocation(
      latitude: userLocation.latitude,
      longitude: userLocation.longitude,
    );

    // 작성할 글
    PostRegisterRequestDTO post = PostRegisterRequestDTO(
      coordinate: coordinate,
      content: content,
      category: category,
    );

    Logger().i(post);

    // 이미지
    List<File> postImages = [];
    for (int i = 0; i < images.length; i++) {
      postImages.add(File(images[i]));
      print(
          'PostRegisterRepository.registerPost - image file - ${File(images[i])}');
    }

    // 글 작성 요청
    Post? result = await apiClient.registerPost(post, postImages).then((value) {
      Logger().i(value);
      return value;
    }).catchError((err) {
      Logger().e(err);
      return null;
    });

    return result;
  }

  // 게시글 수정
  Future<Post?> updatePost(
    int postId,
    UserLocation userLocation,
    String content,
    String category,
    List<String> images,
  ) async {
    // TODO: 위치 공유 넣기

    // 글 작성 위치 == 사용자 위치
    PostLocation coordinate = PostLocation(
      latitude: userLocation.latitude,
      longitude: userLocation.longitude,
    );

    // 작성할 글
    PostRegisterRequestDTO post = PostRegisterRequestDTO(
      coordinate: coordinate,
      category: content,
      content: category,
    );

    // 이미지
    List<File> postImages = [];
    for (int i = 0; i < images.length; i++) {
      postImages.add(File(images[i]));
      print(
          'PostRegisterRepository.registerPost - image file - ${File(images[i])}');
    }

    return null;

    // 글 수정 요청
    await apiClient.updatePost(postId, post, postImages).then((value) {
      Logger().i(value);
      return value;
    }).catchError((err) {
      Logger().e(err);
    });

    return null;
  }

  UserLocation? getUserLocation() {
    return userLocationLocalClient.findOne();
  }
}
