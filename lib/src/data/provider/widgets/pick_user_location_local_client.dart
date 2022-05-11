import 'dart:convert';

import 'package:share_delivery/src/data/model/user/user_location/user_location.dart';
import 'package:share_delivery/src/utils/shared_preferences_util.dart';

class PickUserLocationLocalClient {
  void register(UserLocation userLocation) {
    // NOTE : 사용자의 위치 데이터를 로컬에 저장하는 함수
    String jsonString = jsonEncode(userLocation);

    List<String>? locationList =
        SharedPrefsUtil.instance.getStringList("userLocation");
    locationList ??= [];

    locationList.insert(0, jsonString);
    SharedPrefsUtil.instance.setStringList("userLocation", locationList);
  }
}
