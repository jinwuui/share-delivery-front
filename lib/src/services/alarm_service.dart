import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:share_delivery/src/controller/notification_controller/notification_controller.dart';
import 'package:share_delivery/src/services/alarm_model.dart';

class AlarmService extends GetxService {
  Future<AlarmService> init() async {
    Hive.registerAdapter(AlarmModelAdapter());
    var box = await Hive.openBox<AlarmModel>('alarm');

    // // TEST Dymmy
    // await box.clear();

    // await box.add(AlarmModel(
    //     type: "friend",
    //     title: "친구요청",
    //     content: "park jin woo 님이 친구요청 했습니다.",
    //     createdAt: DateTime.now()));
    // await box.add(AlarmModel(
    //     type: "deliveryRoom",
    //     title: "공유 배달 모집글",
    //     content: "투존치킨 시키실 분 주도자가 주문을 등록했습니다.",
    //     createdAt: DateTime.now()));
    return this;
  }

  @override
  void onClose() async {
    // await NotificationController.to.cancelAllNotifications();
  }

  //TODO: alarm service box clear
  Future<void> clear() async {
    var box = await Hive.openBox<AlarmModel>('alarm');
    await box.clear();
  }

  static Future<void> addAlarm(AlarmModel alarmModel) async {
    var box = Hive.box<AlarmModel>('alarm');
    await box.add(alarmModel);
    return;
  }

  static Future<void> removeAlarm(int index) async {
    var box = Hive.box<AlarmModel>('alarm');
    await box.deleteAt(index);
    return;
  }
}
