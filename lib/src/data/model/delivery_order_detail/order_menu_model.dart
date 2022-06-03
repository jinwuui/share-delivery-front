import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_menu_model.freezed.dart';
part 'order_menu_model.g.dart';

@Freezed()
class OrderMenuModel with _$OrderMenuModel {
  const factory OrderMenuModel({
    required int entryOrderId,
    required int accountId,
    required String nickName,
    required String type,
    required String status,
    required List<Menu> menus,
    required DateTime createdDateTime,
  }) = _OrderMenuModel;

  factory OrderMenuModel.fromJson(Map<String, Object?> json) =>
      _$OrderMenuModelFromJson(json);
}

@Freezed()
class Menu with _$Menu {
  const factory Menu({
    required int orderMenuId,
    required String menuName,
    required int quantity,
    required int price,
    @Default([]) List<Menu> optionMenus,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}
