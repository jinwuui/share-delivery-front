import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_recruit_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_room_info_detail_controller.dart';
import 'package:share_delivery/src/routes/route.dart';
import 'package:share_delivery/src/services/alarm_model.dart';
import 'package:share_delivery/src/services/alarm_service.dart';

// create new AndroidNotificationChannel
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.max,
);

// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);

// Create the channel on the device
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message ${message.messageId}');
  // showNotificationView(message);

  final data = message.data;
  final title = message.notification!.title;
  final body = message.notification!.body;

  Logger().w("title :  $title\n body : $body\n data : $data");
}

Future<void> showNotificationView(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  if (notification != null && android != null) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body == "null" ? "" : notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          icon: android.smallIcon,
        ),
      ),
    );
  }
}

class NotificationController extends GetxController {
  static NotificationController get to => Get.find();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  Rxn<RemoteMessage> message = Rxn<RemoteMessage>();
  late final String fcmToken;

  @override
  void onInit() async {
    await _initNotification();
    await _getToken();
    super.onInit();
  }

  Future<void> _getToken() async {
    fcmToken = (await _messaging.getToken())!;
    Logger().w(fcmToken);
  }

  Future<void> _initNotification() async {
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    // init FirebaseMessaging permission
    _messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    // init flutter local notification android channel
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // background (callback 항상 최상단에 있어야 함)
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Handling a foreground message ${message.messageId}');

      // local notification to show to users using the created channel.
      showNotificationView(message);

      final data = message.data;
      final title = message.notification!.title;
      final body = message.notification!.body;

      Logger().w("title :  $title\n body : $body\n data : $data");
      handleDeliveryRoomMessage(message);
    });

    // FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOnClick);
  }

  // click notification event
  void _handleMessageOnClick(RemoteMessage message) {
    final eventType = message.data['type'];
    final roomId = message.data['roomId'];

    addFcmInAlarmList(message);

    // click event
    switch (eventType) {
      case 'recuritmentCompleted':
        Get.toNamed(
          Routes.DELIVERY_HISTORY_DETAIL,
          arguments: {'deliveryRoomId': roomId},
        );
        break;
      case 'deliveryRoomUpdated':
        break;
      case 'completed':
        break;
      default:
        break;
    }
  }

  // Add fcm in alarm list
  addFcmInAlarmList(RemoteMessage message) {
    final eventType = message.data['type'];
    final title = message.notification!.title;
    final body = message.notification!.body;

    // Add Notification in Alarm list
    AlarmModel alarmModel = AlarmModel(
      type: eventType,
      title: title!,
      content: body ?? title,
      createdAt: message.sentTime!,
    );

    AlarmService.addAlarm(alarmModel);
  }

  // fcm 상태에 따라 방 상태 변경
  Future<void> handleDeliveryRoomMessage(RemoteMessage message) async {
    final eventType = message.data['type'];
    final roomId = message.data['roomId'];

    addFcmInAlarmList(message);

    switch (eventType) {
      case 'ENTRY_ORDERS':
      case 'CLOSE_RECRUIT':
      case 'WAITING_DELIVERY':
      case 'COMPLETED_ORDER':
      case 'COMPLETE_DELIVERY':
      case 'EXIT_ROOM':
        // delivery history page에 없는 경우에는 페이지 이동
        if (!Get.isRegistered<DeliveryOrderController>()) {
          Get.toNamed(
            Routes.DELIVERY_HISTORY_DETAIL,
            arguments: {'deliveryRoomId': roomId},
          );
          return;
        }
        1.delay();
        await DeliveryRoomInfoDetailController.to.getDeliveryRoomInfo();
        DeliveryRecruitController.to.getOrderList(
            deliveryRoomId:
                DeliveryRoomInfoDetailController.to.deliveryRoom.roomId);

        break;
      case 'ORDER_REJECTED':
      case 'DELETE_DELIVERY':
        Get.offAllNamed(Routes.INITIAL);
        break;
      case 'COMPLETE_DELIVERY_ROOM':
        if (Get.isRegistered<DeliveryOrderController>()) {
          await DeliveryRoomInfoDetailController.to.getDeliveryRoomInfo();
          DeliveryRecruitController.to.getOrderList(
              deliveryRoomId:
                  DeliveryRoomInfoDetailController.to.deliveryRoom.roomId);
        }
        break;
      default:
        break;
    }
  }

  // Future<void> showOngoingNotification(String title, String body) async {
  //   AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(channel.id, channel.name,
  //           channelDescription: 'your channel description',
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           ongoing: true,
  //           autoCancel: false);

  //   NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);

  //   await flutterLocalNotificationsPlugin.show(
  //       0, title, body, platformChannelSpecifics);
  // }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
