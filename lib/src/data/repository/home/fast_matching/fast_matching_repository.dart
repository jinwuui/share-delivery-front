import 'package:share_delivery/src/data/provider/home/fast_matching/fast_matching_api_client.dart';

class FastMatchingRepository {
  FastMatchingApiClient apiClient;

  FastMatchingRepository({required this.apiClient});

  Future<bool> requestFastMatching(String tag) async {
    return await apiClient.requestFastMatching(tag);
  }
}
