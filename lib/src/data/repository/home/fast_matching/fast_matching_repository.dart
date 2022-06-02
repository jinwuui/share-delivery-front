import 'package:share_delivery/src/data/model/home/fast_matching/fast_matching_request_dto/fast_matching_request_dto.dart';
import 'package:share_delivery/src/data/model/home/fast_matching/fast_matching_response_dto/fast_matching_response_dto.dart';
import 'package:share_delivery/src/data/model/user/user_location/user_location.dart';
import 'package:share_delivery/src/data/provider/home/fast_matching/fast_matching_api_client.dart';
import 'package:share_delivery/src/data/provider/widgets/user_location_local_client.dart';
import 'package:share_delivery/src/utils/get_snackbar.dart';

class FastMatchingRepository {
  FastMatchingApiClient apiClient;
  UserLocationLocalClient localClient;

  FastMatchingRepository({required this.apiClient, required this.localClient});

  Future<FastMatchingResponseDTO?> requestFastMatching(
      String matchingTag) async {
    FastMatchingRequestDTO fastMatchingRequestDTO =
        FastMatchingRequestDTO(matchingTag: matchingTag);

    UserLocation? userLocation = localClient.findOne();
    if (userLocation == null) {
      GetSnackbar.on("알림", "위치 설정을 먼저 해주세요!");
      return null;
    }

    return await apiClient.requestFastMatching(
      userLocation.latitude,
      userLocation.longitude,
      fastMatchingRequestDTO,
    );
  }
}
