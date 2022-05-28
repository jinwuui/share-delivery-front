import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_persistent_keyboard_height/flutter_persistent_keyboard_height.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/controller/notification_controller/notification_controller.dart';
import 'package:share_delivery/src/controller/root_controller.dart';
import 'package:share_delivery/src/data/provider/authentication/authentication_api_client.dart';
import 'package:share_delivery/src/data/provider/authentication/authentication_local_client.dart';
import 'package:share_delivery/src/data/repository/authentication_repository.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/ui/login/state/authentication_state.dart';
import 'package:share_delivery/src/utils/dio_util.dart';
import 'package:share_delivery/src/utils/shared_preferences_util.dart';
import 'package:share_delivery/src/utils/time_util.dart';

import 'firebase_options.dart';

Future<void> main() async {
  // timeutil 선언
  TimeUtil.setLocalMessages();
  // runApp 메소드의 시작 지점에서 Flutter 엔진과 위젯의 바인딩이 미리 완료되어 있게 만들어줌
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 앱 초기화
  await initialize();

  // 스플래시 이미지 ON
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 테스트용 Timer TODO: 앱 완성도 높아지면 제거할 것 (= 타이머 걸지않아도 initialize 만으로 시간이 필요할 때)
  Timer(const Duration(seconds: 1), () async {
    runApp(const MyApp());

    // 스플래시 이미지 OFF // TODO: 앱 시작할 때 초기화(로딩, 로그인 확인 등등) 끝나고 사용
    FlutterNativeSplash.remove();
  });
}

Future<void> initialize() async {
  // SharedPreference 초기화
  await SharedPrefsUtil.init();

  // 설정 파일 로딩
  await dotenv.load(fileName: ".env");

  // 인증 컨트롤러 Get 세팅
  Get.put(
    AuthenticationController(
      repository: AuthenticationRepository(
        apiClient: AuthenticationApiClient(DioUtil.loginDio()),
        localClient: AuthenticationLocalClient(),
      ),
    ),
  );
}

class MyApp extends GetView<AuthenticationController> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.state is Authenticated) {
      print("is Auth");
    } else {
      print("no");
    }
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(RootController());
        Get.put(NotificationController());
      }),
      title: 'Share Delivery',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
        ),
      ),
      initialRoute:
          controller.state is Authenticated ? Routes.INITIAL : Routes.LOGIN,
      getPages: AppPages.routes,
      builder: (context, child) =>
          PersistentKeyboardHeightProvider(child: child!),
    );
  }
}
