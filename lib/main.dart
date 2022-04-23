import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/authentication_controller.dart';
import 'package:share_delivery/src/controller/root_controller.dart';
import 'package:share_delivery/src/data/repository/authentication_repo.dart';
import 'package:share_delivery/src/root.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/ui/login/login.dart';
import 'package:share_delivery/src/utils/authentication/authentication_state.dart';

Future<void> main() async {
  // runApp 메소드의 시작 지점에서 Flutter 엔진과 위젯의 바인딩이 미리 완료되어 있게 만들어줌
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // 스플래시 이미지 ON
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 테스트용 Timer TODO: 앱 완성도 높아지면 제거할 것 (= 타이머 걸지않아도 initialize 만으로 시간이 필요할 때)
  Timer(const Duration(seconds: 1), () async {
    // 앱 초기화
    await initialize();
    runApp(const MyApp());

    // 스플래시 이미지 OFF // TODO: 앱 시작할 때 초기화(로딩, 로그인 확인 등등) 끝나고 사용
    FlutterNativeSplash.remove();
  });
}

Future<void> initialize() async {
  // 설정 파일 로딩
  await dotenv.load(fileName: ".env");

  // 인증 컨트롤러 Get 세팅
  Get.lazyPut(() => AuthenticationController(Get.put(AuthenticationRepo())));
}

class MyApp extends GetWidget<AuthenticationController> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Share Delivery',
      initialBinding: BindingsBuilder(() {
        Get.put(RootController());
      }),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(231, 129, 17, 1),
        ),
      ),
      home: Obx(() {
        if (controller.state is UnAuthenticated) {
          return Login();
        } else if (controller.state is Authenticated) {
          Get.back();
          return Root();
        } else {
          return SizedBox.shrink(
            child: Text("this state is Loading??"),
          );
        }
      }),
      getPages: AppPages.routes,
    );
  }
}
