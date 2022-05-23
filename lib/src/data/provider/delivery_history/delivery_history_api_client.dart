import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:share_delivery/src/data/model/delivery_history/delivery_history_model.dart';

part 'delivery_history_api_client.g.dart';

@RestApi(baseUrl: "http://kitcapstone.iptime.org:8080")
abstract class DeliveryHistoryApiClient {
  factory DeliveryHistoryApiClient(Dio dio, {String baseUrl}) =
      _DeliveryHistoryApiClient;

  @GET('/api/delivery-histories')
  Future<List<DeliveryHistoryModel>> getDeliveryHistoryAll();
}
