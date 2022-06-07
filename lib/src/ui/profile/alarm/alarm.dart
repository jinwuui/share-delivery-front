import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:share_delivery/src/controller/profile/alarm/alarm_controller.dart';
import 'package:share_delivery/src/controller/profile/profile_controller.dart';
import 'package:share_delivery/src/services/alarm_model.dart';
import 'package:share_delivery/src/services/alarm_service.dart';
import 'package:share_delivery/src/services/setting_service.dart';
import 'package:share_delivery/src/utils/time_util.dart';

class Alarm extends GetView<AlarmController> {
  const Alarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.isLoad.value == true
        ? Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.black, //change your color here
              ),
              title: Text(
                "알림함",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              backgroundColor: Colors.transparent,
              bottom: PreferredSize(
                child: Container(
                  color: Colors.grey.shade300,
                  height: 1.0,
                ),
                preferredSize: Size.fromHeight(1.0),
              ),
              elevation: 0.0,
            ),
            body: ValueListenableBuilder(
                valueListenable: Hive.box<AlarmModel>('alarm').listenable(),
                builder: (context, Box<AlarmModel> box, _) {
                  Box<AlarmModel> alarmBox = box;
                  List<AlarmModel> alarmList = [...alarmBox.values.toList()];
                  for (var element in controller.friendAlarms) {
                    alarmList.add(AlarmModel(
                      type: 'friend',
                      title: element.nickname,
                      content: "친구신청",
                      createdAt: element.createdDate,
                      accountId: element.accountId,
                    ));
                  }
                  alarmList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
                  return ListView.separated(
                    itemCount: alarmList.length,
                    itemBuilder: (context, index) {
                      return _buildAlarmListTile(
                        alarmList[index],
                        index,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: Colors.grey.shade500,
                      );
                    },
                  );
                }),
          )
        : Container());
  }

  Widget _buildFriendAlarmListTile(AlarmModel alarm, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        title: Text(
          alarm.title,
          style: TextStyle(fontSize: 18),
        ),
        subtitle: Text(alarm.content),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  await ProfileController.to
                      .acceptFriend(alarm.accountId!, FriendAcceptState.ACCEPT);
                  Get.snackbar("친구 수락", "친구가 수락되었습니다.",
                      snackPosition: SnackPosition.BOTTOM,
                      isDismissible: true,
                      duration: Duration(seconds: 1));
                } catch (e) {
                  print(e);
                }
              },
              child: Text("수락"),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await ProfileController.to
                      .acceptFriend(alarm.accountId!, FriendAcceptState.REJECT);

                  Get.snackbar("친구 수락 거절", "친구 수락에 거절하였습니다.",
                      snackPosition: SnackPosition.BOTTOM,
                      isDismissible: true,
                      duration: Duration(seconds: 1));
                } catch (e) {
                  print(e);
                }
              },
              child: Text("거절"),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlarmListTile(AlarmModel alarm, int index) {
    if (alarm.type == 'friend') {
      return _buildFriendAlarmListTile(alarm, index);
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  alarm.title,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Text(TimeUtil.timeAgo(alarm.createdAt.toLocal()))),
            ],
          ),
          subtitle: Text(alarm.content),
        ),
      );
    }
  }
}
