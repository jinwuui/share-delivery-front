import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

@Freezed()
class ReportModel with _$ReportModel {
  const factory ReportModel({
    required int reportCategoryId,
    required int parentCategory,
    required String categoryName,
    required int level,
  }) = _ReportModel;

  factory ReportModel.fromJson(Map<String, Object?> json) =>
      _$ReportModelFromJson(json);
}
