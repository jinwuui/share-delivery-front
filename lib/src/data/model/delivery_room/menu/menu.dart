import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@Freezed()
class Menu with _$Menu {
  const factory Menu({
    required String name,
    required int price,
    required int quantity,
    @Default([]) List<Menu> optionList,
  }) = _Menu;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}
