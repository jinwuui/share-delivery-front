import 'package:location/location.dart';
import 'package:share_delivery/src/utils/shared_preferences_util.dart';

class PickUserLocationLocalClient {
  void register(LocationData locationData) {
    String s = locationDataToJsonString(locationData);
    SharedPrefsUtil.instance.setString("userLocation", s);
  }

  String locationDataToJsonString(LocationData locationData) {
    return "{ \"latitude\":${locationData.latitude}, \"longitude\":${locationData.longitude} }";
  }
}
