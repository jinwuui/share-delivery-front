import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@Freezed()
class ChatModel with _$ChatModel {
  const factory ChatModel({
    required int accountId,
    required String message,
    required DateTime sendDateTime,
    @Default(0) int chatId,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, Object?> json) =>
      _$ChatModelFromJson(json);
}
