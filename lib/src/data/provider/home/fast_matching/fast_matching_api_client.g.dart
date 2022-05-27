// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fast_matching_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _FastMatchingApiClient implements FastMatchingApiClient {
  _FastMatchingApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://kitcapstone.iptime.org:8080';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<FastMatchingInfo> requestFastMatching(fastMatchingTag) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(fastMatchingTag.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<FastMatchingInfo>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/fast-delivery-rooms/participate',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FastMatchingInfo.fromJson(_result.data!);
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
