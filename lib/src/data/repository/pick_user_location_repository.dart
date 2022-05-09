import 'package:location/location.dart';
import 'package:share_delivery/src/data/model/user/user_location.dart';
import 'package:share_delivery/src/data/provider/widgets/pick_user_location_local_client.dart';

class PickUserLocationRepository {
  final PickUserLocationLocalClient localClient;

  PickUserLocationRepository({required this.localClient});

  void saveLocationDataToLocal(String description, LocationData locationData) {
    UserLocation userLocation = UserLocation(
        description: description,
        latitude: locationData.latitude!,
        longitude: locationData.longitude!);

    localClient.register(userLocation);
  }
}
