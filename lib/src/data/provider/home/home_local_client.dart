import 'dart:convert';

import 'package:location/location.dart';
import 'package:share_delivery/src/utils/shared_preferences_util.dart';

class HomeLocalClient {
  LocationData findRecentUserLocation() {
    LocationData result = LocationData.fromMap({"isMock": true});
    String? jsonString = SharedPrefsUtil.instance.getString("userLocation");

    if (jsonString != null) {
      Map<String, dynamic> locationDataMap = jsonDecode(jsonString);
      return LocationData.fromMap(locationDataMap);
    }

    return result;
  }
}
