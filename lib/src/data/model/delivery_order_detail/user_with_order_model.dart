import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_with_order_model.freezed.dart';
part 'user_with_order_model.g.dart';

@Freezed()
class UserWithOrderModel with _$UserWithOrderModel {
  const factory UserWithOrderModel({
    required String userId,
    required DateTime orderDate,
    required Map<String, int> menuList,
    required String nickname,
  }) = _UserWithOrderModel;

  factory UserWithOrderModel.fromJson(Map<String, Object?> json) =>
      _$UserWithOrderModelFromJson(json);
}

//TODO: 자신의 주문은 서버로 보내야하나?
// 보내야지 다른 사용자가 본다..
// 이건 게시글 생성할 때 보내야할 듯
// 주문자 정보는 클라이언트 db에서 처리해야하나, api 호출로 불러와야되나

//TODO: 모집완료되면 사용자 정보와 주문자 정보 서버로 보내기