import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/model/user/user_location/user_location.dart';
import 'package:share_delivery/src/utils/shared_preferences_util.dart';

class UserLocationLocalClient {
  void register(UserLocation userLocation) {
    // NOTE : 사용자의 위치 데이터를 로컬에 저장하는 함수
    String jsonString = jsonEncode(userLocation);

    List<String>? locationList =
        SharedPrefsUtil.instance.getStringList("userLocation");
    locationList ??= [];

    locationList.insert(0, jsonString);
    SharedPrefsUtil.instance.setStringList("userLocation", locationList);
  }

  UserLocation? findOne() {
    // 사용자의 위치 데이터를 로컬에서 가져오는 함수
    List<String>? locationList =
        SharedPrefsUtil.instance.getStringList("userLocation");

    Logger().i(locationList);

    if (locationList == null) {
      // 저장된 사용자 위치 데이터 없음
      return null;
    }

    // 저장된 사용자 위치 데이터가 존재함
    String userLocationString = locationList.first;
    Map<String, dynamic> jsonMap = jsonDecode(userLocationString);
    return UserLocation.fromJson(jsonMap);
  }
}
