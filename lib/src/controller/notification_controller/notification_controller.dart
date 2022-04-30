import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
}

class NotificationController extends GetxController {
  static NotificationController get to => Get.find();
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  Rxn<RemoteMessage> message = Rxn<RemoteMessage>();
  late final String fcmToken;

  @override
  void onInit() {
    print("notification init");
    _initNotification();
    _getToken();
    super.onInit();
  }

  Future<void> _initNotification() async {
    _messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _getToken() async {
    fcmToken = (await _messaging.getToken())!;
  }
}

  // @override
  // void onInit() {
  //   _initNotification();
  //   _getToken();
  //   super.onInit();
  // }

  // Future<void> _getToken() async {
  //   try {
  //     String? token = await _messaging.getToken();
  //     print(token);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void _initNotification() {
  //   _messaging.requestNotificationPermissions(const IosNotificationSettings(
  //       sound: true, badge: true, alert: true, provisional: true));

  //   _messaging.configure(
  //     onMessage: _onMessage,
  //     onLaunch: _onLaunch,
  //     onResume: _onResume,
  //   );
  // }

  // Future<void> _onResume(Map<String, dynamic> message) {
  //   print("_onResume : $message");
  //   return null;
  // }

  // Future<void> _onLaunch(Map<String, dynamic> message) async {
  //   print("_onLaunch : $message");
  //   _actionOnNotification(message);
  //   return null;
  // }

  // void _actionOnNotification(Map<String, dynamic> messageMap) {
  //   message(messageMap);
  // }

  // Future<void> _onMessage(Map<String, dynamic> message) async {
  //   print("_onMessage : $message");
  // }