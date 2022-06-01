import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:share_delivery/src/services/alarm_model.dart';
import 'package:share_delivery/src/services/alarm_service.dart';
import 'package:share_delivery/src/utils/time_util.dart';

class Alarm extends StatelessWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return ListView.builder(
                shrinkWrap: true,
                itemCount: alarmBox.values.length,
                itemBuilder: (_, index) {
                  return _buildAlarmListTile(
                      alarmBox.values
                          .elementAt(alarmBox.values.length - index - 1),
                      alarmBox.values.length - index - 1);
                });
          }),
    );
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
                // TODO: 친구 신청 수락 로직
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
                // TODO: 친구 신청 거절 로직
                await AlarmService.removeAlarm(index);

                Get.snackbar(
                  "친구 신청 거절",
                  "친구 신청이 거절되었습니다.",
                  duration: Duration(seconds: 1),
                );
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
            children: [
              Text(
                alarm.title,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 10),
              Text(TimeUtil.timeAgo(alarm.createdAt.toLocal())),
            ],
          ),
          subtitle: Text(alarm.content),
        ),
      );
    }
  }
}
