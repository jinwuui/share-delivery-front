import 'package:hive/hive.dart';

part 'alarm_model.g.dart';

@HiveType(typeId: 0)
class AlarmModel extends HiveObject {
  @HiveField(0)
  final String type;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String content;

  @HiveField(3)
  final DateTime createdAt;

  AlarmModel({
    required this.type,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'AlarmModel(type: $type, title: $title, content: $content, createdAt: $createdAt)';
  }
}
