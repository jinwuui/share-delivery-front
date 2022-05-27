import 'package:share_delivery/src/data/model/home/fast_matching/fast_matching_info/fast_matching_info.dart';
import 'package:share_delivery/src/data/model/home/fast_matching/fast_matching_tag/fast_matching_tag.dart';
import 'package:share_delivery/src/data/provider/home/fast_matching/fast_matching_api_client.dart';

class FastMatchingRepository {
  FastMatchingApiClient apiClient;

  FastMatchingRepository({required this.apiClient});

  Future<FastMatchingInfo> requestFastMatching(String tag) async {
    return await apiClient
        .requestFastMatching(FastMatchingTag(matchingTag: tag));
  }
}
