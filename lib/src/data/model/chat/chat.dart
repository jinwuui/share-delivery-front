import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@Freezed()
class ChatModel with _$ChatModel {
  const factory ChatModel({
    required int accountId,
    required int roomId,
    required String nickname,
    required String sentAt,
    required String message,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, Object?> json) =>
      _$ChatModelFromJson(json);
}
