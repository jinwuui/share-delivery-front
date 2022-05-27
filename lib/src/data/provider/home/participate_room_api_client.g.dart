// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participate_room_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _ParticipateRoomApiClient implements ParticipateRoomApiClient {
  _ParticipateRoomApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://kitcapstone.iptime.org:8080';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<void> requestParticipating(deliveryRoomId, menuList) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = menuList.map((e) => e.toJson()).toList();
    await _dio.fetch<void>(_setStreamType<void>(Options(
            method: 'POST', headers: _headers, extra: _extra)
        .compose(
            _dio.options, '/api/delivery-rooms/${deliveryRoomId}/entry-orders',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
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
