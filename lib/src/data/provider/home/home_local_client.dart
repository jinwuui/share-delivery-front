import 'dart:convert';

import 'package:share_delivery/src/data/model/user/user_location/user_location.dart';
import 'package:share_delivery/src/utils/shared_preferences_util.dart';

class HomeLocalClient {
  UserLocation? findRecentUserLocation() {
    List<String>? userLocations =
        SharedPrefsUtil.instance.getStringList("userLocation");

    print("userLocations : $userLocations");
    if (userLocations == null) return null;

    String recentLocation = userLocations.first;
    // String test =
    //     "{\"description\": \"복지센터\", \"latitude\": 35.81729283680531, longitude: 128.5139882102289}";

    Map<String, dynamic> jsonMap = jsonDecode(recentLocation);
    print(jsonMap);
    return UserLocation.fromJson(jsonMap);
  }
}
