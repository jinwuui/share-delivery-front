// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_room_register_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _DeliveryRoomRegisterApiClient implements DeliveryRoomRegisterApiClient {
  _DeliveryRoomRegisterApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://kitcapstone.iptime.org:8080';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ReceivingLocation?> registerReceivingLocation(
      receivingLocation) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(receivingLocation.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<ReceivingLocation>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/receiving-locations',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        _result.data == null ? null : ReceivingLocation.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DeliveryRoomRegisterResDTO> registerDeliveryRoom(
      deliveryRoomRegisterDTO) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(deliveryRoomRegisterDTO.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DeliveryRoomRegisterResDTO>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/delivery-rooms',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DeliveryRoomRegisterResDTO.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
