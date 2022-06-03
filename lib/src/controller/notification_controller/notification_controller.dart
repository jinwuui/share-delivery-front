import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:retrofit/http.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_controller.dart';
import 'package:share_delivery/src/controller/delivery_order_detail/delivery_order_tab_controller.dart';
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
  showNotificationView(message);
}

Future<void> showNotificationView(RemoteMessage message) async {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  if (notification != null && android != null) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
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
  void onInit() {
    print("notification init");
    _initNotification();
    _getToken();
    super.onInit();
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
      // local notification to show to users using the created channel.
      showNotificationView(message);

      _handleMessage(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  Future<void> _getToken() async {
    fcmToken = (await _messaging.getToken())!;
    Logger().w(fcmToken);
  }

  void _handleMessage(RemoteMessage message) {
    final eventType = message.data['type'];
    final title = message.notification!.title;
    final body = message.notification!.body;

    AlarmModel alarmModel = AlarmModel(
      type: eventType,
      title: title!,
      content: body!,
      createdAt: message.sentTime!,
    );
    AlarmService.addAlarm(alarmModel);

    Logger().w(eventType);
    Logger().w(message.data);
    switch (eventType) {
      case 'recuritmentCompleted':
        DeliveryOrderController.to
            .changeStatus(DeliveryOrderStatus.recuritmentCompleted);
        Get.toNamed(Routes.DELIVERY_HISTORY_DETAIL);
        break;
      case 'deliveryRoomUpdated':
        // DeliveryOrderController.to.getOrderDetail(message.data['orderId']);
        // DeliveryOrderTabController.to.setTabIndex(2);
        break;
      case 'completed':
        // DeliveryOrderController.to.getOrderDetail(message.data['orderId']);
        // DeliveryOrderTabController.to.setTabIndex(3);
        break;
      default:
        break;
    }
  }
}
