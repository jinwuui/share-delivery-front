import 'package:location/location.dart';
import 'package:share_delivery/src/data/provider/pick_user_location_local_client.dart';

class PickUserLocationRepository {
  final PickUserLocationLocalClient localClient;

  PickUserLocationRepository({required this.localClient});

  void saveLocationDataToLocal(LocationData locationData) {
    localClient.register(locationData);
  }
}
