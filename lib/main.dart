import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/root_controller.dart';
import 'package:share_delivery/src/routes/route.dart';

Future<void> main() async {
  // runApp 메소드의 시작 지점에서 Flutter 엔진과 위젯의 바인딩이 미리 완료되어 있게 만들어줌
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // 스플래시 이미지 ON
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 설정 파일 로딩
  await dotenv.load(fileName: ".env");

  Timer(const Duration(seconds: 1), () {
    runApp(const MyApp());

    // 스플래시 이미지 OFF // TODO: 앱 시작할 때 초기화(로딩, 로그인 확인 등등) 끝나고 사용
    FlutterNativeSplash.remove();
  });
}

class MyApp extends StatelessWidget {
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
      initialRoute: Routes.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
