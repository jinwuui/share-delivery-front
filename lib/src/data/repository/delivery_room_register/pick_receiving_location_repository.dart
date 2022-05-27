import 'dart:convert';

import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/utils/shared_preferences_util.dart';

class PickReceivingLocationRepository {
  List<ReceivingLocation> find() {
    List<String>? locationList =
        SharedPrefsUtil.instance.getStringList("receivingLocations");

    print("receivingLocations : $locationList");
    if (locationList == null) return [];

    List<ReceivingLocation> result = <ReceivingLocation>[];

    for (int i = 0; i < locationList.length; i++) {
      final jsonMap = jsonDecode(locationList[i]);

      result.add(ReceivingLocation.fromJson(jsonMap));
    }

    print(
        'PickReceivingLocationRepository.findReceivingLocationHistory $result');
    return result;
  }

  void register(String description, double lat, double lng) {
    // NOTE : 사용자의 위치 데이터를 로컬에 저장하는 함수
    Map<String, dynamic> jsonMap = {
      "description": description,
      "lat": lat,
      "lng": lng,
    };
    String jsonString = jsonEncode(jsonMap);

    List<String>? locationList =
        SharedPrefsUtil.instance.getStringList("receivingLocations");
    locationList ??= [];

    locationList.insert(0, jsonString);
    SharedPrefsUtil.instance.setStringList("receivingLocations", locationList);
  }
}
