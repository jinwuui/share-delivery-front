import 'package:dio/dio.dart';
import 'package:share_delivery/src/utils/shared_preferences_util.dart';

class DioUtil {
  static Dio getDio() {
    Dio dio = Dio();

    dio.interceptors.clear();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // 기기에 저장된 AccessToken 로드
          final accessToken = SharedPrefsUtil.instance.getString("accessToken");

          print('DioUtil.getDio');
          print(accessToken);
          // 헤더 지정
          options.headers["Authorization"] = "Bearer $accessToken";
          options.headers["Content-Type"] = "application/json";

          return handler.next(options);
        },
        onError: (error, handler) async {
          // 인증 오류가 발생했을 경우: AccessToken 의 만료
          if (error.response?.statusCode == 401) {
            print("401 에러 발생!!!");
            // 기기에 저장된 AccessToken 과 RefreshToken 로드
            final accessToken =
                SharedPrefsUtil.instance.getString("accessToken");
            final refreshToken =
                SharedPrefsUtil.instance.getString("refreshToken");

            // 토큰 갱신 요청을 담당할 dio 객체 구현 후 그에 따른 interceptor 정의
            var refreshDio = Dio();

            refreshDio.interceptors.clear();

            refreshDio.interceptors.add(
              InterceptorsWrapper(
                onError: (error, handler) async {
                  // 다시 인증 오류가 발생했을 경우: RefreshToken 의 만료
                  if (error.response?.statusCode == 401) {
                    print('DioUtil.getDio: 토큰 갱신 오류 발생 - Refresh Token 만료');
                    // 기기의 자동 로그인 정보 삭제
                    // await storage.deleteAll();

                    // ...
                    // 로그인 만료 dialog 발생 후 로그인 페이지로 이동
                    // ...
                  } else {
                    print('DioUtil.getDio: 401 외의 에러');
                    print(error.response?.statusCode);
                    print(error.response?.data);
                  }
                  return handler.next(error);
                },
              ),
            );

            // 토큰 갱신 API 요청 - AccessToken(만료), RefreshToken 포함
            final refreshResponse = await refreshDio.post(
              '/api/auth/refreshed-token',
              data: {
                "accessToken": accessToken,
                "refresh": refreshToken,
              },
            );

            // response 로부터 새로 갱신된 AccessToken 과 RefreshToken 파싱
            final newAccessToken = refreshResponse.data["accessToken"];
            final newRefreshToken = refreshResponse.data["refreshToken"];

            // 기기에 저장된 AccessToken 과 RefreshToken 갱신
            SharedPrefsUtil.instance.setString("accessToken", newAccessToken);
            SharedPrefsUtil.instance.setString("refreshToken", newRefreshToken);

            // AccessToken 의 만료로 수행하지 못했던 API 요청에 담겼던 AccessToken 갱신
            error.requestOptions.headers['Authorization'] =
                'Bearer $newAccessToken';

            // 수행하지 못했던 API 요청 복사본 생성
            final clonedRequest = await dio.request(
              error.requestOptions.path,
              options: Options(
                method: error.requestOptions.method,
                headers: error.requestOptions.headers,
              ),
              data: error.requestOptions.data,
              queryParameters: error.requestOptions.queryParameters,
            );

            // API 복사본으로 재요청
            return handler.resolve(clonedRequest);
          } else {
            print("ERROR: $error");
            print('DioUtil.getDio: 401 제외한 에러');
            print(error.response?.statusCode);
            print(error.response?.data);
          }
        },
      ),
    );

    // interceptor 가 완성된 dio 반환
    return dio;
  }
}
