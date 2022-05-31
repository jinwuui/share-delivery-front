import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/data/model/chat/chat.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/utils/shared_preferences_util.dart';
import 'package:socket_io_client/socket_io_client.dart';

class DeliveryRoomChatController extends GetxController {
  static DeliveryRoomChatController get to => Get.find();
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final List<ChatModel> messages = [];

  User user = AuthenticationController.to.state.props.first as User;
  late final Socket socket;
  late final int deliveryRoomId;
  @override
  void onInit() async {
    await socketInit();
    super.onInit();
  }

  @override
  void onClose() {
    // socket disconnect
    deliveryRoomId = Get.arguments['deliveryRoomId'];

    socket.disconnect();
    super.onClose();
  }

  Future<void> fetchMessageList() async {
    DateTime currentTime = DateTime.now();
    // return;
  }

  Future<void> socketInit() async {
    try {
      String hostName = dotenv.get('SERVER_HOST');
      // TODO: jwt token
      // String jwtToken = SharedPrefsUtil.instance.getString('accessToken');
      String jwtToken =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhY2NvdW50SWQiOjEsInBob25lTnVtYmVyIjoiMDEwMDAwMDAwMDEiLCJyb2xlIjoiUk9MRV9VU0VSIiwiaXNzIjoia2l0Y2Quc2hhcmUtZGVsaXZlcnkiLCJleHAiOjE2NTY1MDI0Mjd9.gzW_MYwJfzErl0kpj0G5zao5ZPdGOUYCoStt91jF_q4";

      socket = io(
        hostName,
        OptionBuilder()
            .setTransports(['websocket'])
            .setQuery({'token': jwtToken})
            .disableAutoConnect()
            .build(),
      );

      socket.connect();

      socket.on('connect', (data) {
        Logger().d('socket connected');

        // 소켓 연결 후 방 참여
        enterRoom(deliveryRoomId);
      });

      socket.on("connect_Error", (data) => print(data));

      socket.on('message', (data) {
        final message = ChatModel.fromJson(data);
        messages.add(message);
      });

      socket.onDisconnect((_) => Logger().d('disconnect'));
    } catch (e) {
      print(e);
    }
    super.onInit();
  }

  void sendMessage(String message) {
    socket.emit(
        "message",
        ChatModel(
            accountId: user.accountId,
            roomId: deliveryRoomId,
            message: message,
            nickname: user.nickname,
            sentAt: DateTime.now().toLocal().toString().substring(0, 16)));
  }

  void enterRoom(int deliveryRoomId) {
    socket.emit('enter_room', deliveryRoomId);
  }
}
