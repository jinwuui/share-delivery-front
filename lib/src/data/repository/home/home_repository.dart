import 'package:location/location.dart';
import 'package:share_delivery/src/data/provider/home/home_api_client.dart';
import 'package:share_delivery/src/data/provider/home/home_local_client.dart';

class HomeRepository {
  final HomeApiClient apiClient;
  final HomeLocalClient localClient;

  HomeRepository({required this.apiClient, required this.localClient});

  LocationData findRecentUserLocation() {
    return localClient.findRecentUserLocation();
  }

  findDeliveryRooms(double lat, double lng) {
    print("-- home repo - 모집글 조회");
    return apiClient.findDeliveryRooms(lat, lng);
  }
}
