import 'package:logger/logger.dart';
import 'package:share_delivery/src/data/model/delivery_room/delivery_room/delivery_room.dart';
import 'package:share_delivery/src/data/model/user/user_location/user_location.dart';
import 'package:share_delivery/src/data/provider/home/home_api_client/home_api_client.dart';
import 'package:share_delivery/src/data/provider/home/home_local_client.dart';

class HomeRepository {
  final HomeApiClient apiClient;
  final HomeLocalClient localClient;

  HomeRepository({required this.apiClient, required this.localClient});

  UserLocation? findRecentUserLocation() {
    return localClient.findRecentUserLocation();
  }

  Future<List<DeliveryRoom>> findDeliveryRooms(
      double latitude, double longitude, int radius) async {
    return await apiClient
        .findDeliveryRooms(latitude, longitude, radius)
        .then((value) {
      return value;
    }).catchError((err) {
      Logger().e(err);
      return <DeliveryRoom>[];
    });
  }
}
