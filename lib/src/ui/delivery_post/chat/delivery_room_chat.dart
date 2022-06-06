import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/chat/delivery_room_chat_controller.dart';
import 'package:share_delivery/src/controller/login/authentication_controller.dart';
import 'package:share_delivery/src/data/model/chat/chat.dart';
import 'package:share_delivery/src/data/model/user/user/user.dart';
import 'package:share_delivery/src/utils/time_util.dart';

class DeliveryRoomChat extends GetView<DeliveryRoomChatController> {
  const DeliveryRoomChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryRoomChatController());
    User user = AuthenticationController.to.state.props.first as User;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFFEAEFF2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: Obx(
                    () => ListView.builder(
                      controller: controller.scrollController,
                      physics: const BouncingScrollPhysics(),
                      reverse: controller.messages.isEmpty ? false : true,
                      itemCount: 1,
                      shrinkWrap: false,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10, bottom: 3),
                          child: Column(
                            mainAxisAlignment: controller.messages.isEmpty
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: controller.messages.map((message) {
                                    return ChatBubble(
                                      date: message.sendDateTime,
                                      message: message.message,
                                      isMe: user.accountId == message.accountId,
                                    );
                                  }).toList()),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                    bottom: 10, left: 20, right: 10, top: 5),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        child: TextField(
                          minLines: 1,
                          maxLines: 5,
                          controller: controller.messageController,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration.collapsed(
                            hintText: "Type a message",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 43,
                      width: 42,
                      child: FloatingActionButton(
                        heroTag: 'chat',
                        backgroundColor: Colors.orange,
                        onPressed: () async {
                          if (controller.messageController.text
                              .trim()
                              .isNotEmpty) {
                            String message =
                                controller.messageController.text.trim();
                            ChatModel chat = ChatModel(
                                accountId: user.accountId,
                                message: message,
                                sendDateTime: DateTime.now().toLocal());
                            controller.sendMessage(chat);

                            controller.messageController.clear();
                          }
                        },
                        mini: true,
                        child: Transform.rotate(
                            angle: 5.79449,
                            child: const Icon(Icons.send, size: 20)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String message;
  final DateTime date;

  ChatBubble({
    required this.message,
    this.isMe = true,
    required this.date,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Column(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            constraints: BoxConstraints(maxWidth: size.width * .5),
            decoration: BoxDecoration(
              color: isMe ? Colors.yellow.shade200 : Color(0xFFFFFFFF),
              borderRadius: isMe
                  ? const BorderRadius.only(
                      topRight: Radius.circular(11),
                      topLeft: Radius.circular(11),
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(11),
                    )
                  : const BorderRadius.only(
                      topRight: Radius.circular(11),
                      topLeft: Radius.circular(11),
                      bottomRight: Radius.circular(11),
                      bottomLeft: Radius.circular(0),
                    ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  message,
                  textAlign: TextAlign.start,
                  softWrap: true,
                  style:
                      const TextStyle(color: Color(0xFF2E1963), fontSize: 14),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Text(
                      TimeUtil.timeAgo(date),
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          color: Color(0xFF594097), fontSize: 9),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class ChatAlarm extends StatelessWidget {
//   final String message;

//   const ChatAlarm({Key? key, required this.message}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             margin: const EdgeInsets.symmetric(vertical: 5.0),
//             constraints: BoxConstraints(maxWidth: size.width * .5),
//             decoration: BoxDecoration(
//               color: Colors.grey,
//               borderRadius: const BorderRadius.only(
//                 topRight: Radius.circular(11),
//                 topLeft: Radius.circular(11),
//                 bottomRight: Radius.circular(11),
//                 bottomLeft: Radius.circular(0),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Text(
//                   message,
//                   textAlign: TextAlign.start,
//                   softWrap: true,
//                   style:
//                       const TextStyle(color: Color(0xFF2E1963), fontSize: 14),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }