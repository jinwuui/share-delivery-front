import 'package:get/get.dart';
import 'package:share_delivery/src/data/repository/evaluate_and_report/evaluate_and_report_repository.dart';

class EvaluateAndReportController extends GetxController {
  EvaluateAndReportRepository repository;

  EvaluateAndReportController({required this.repository});

  RxBool alreadyEvaluatingDone = false.obs;
  RxBool alreadyReportingDone = false.obs;

  var evaluateList = <Evaluation>[
    Evaluation(2, ""),
    Evaluation(3, ""),
  ].obs;

  // final RxList<List<bool>> selected = <List<bool>>[
  //   [true, false, false],
  //   [true, false, false],
  // ].obs;

  // 모집글 등록을 위한 상세 정보
  // final RxList<bool> selected = <bool>[false, false, false].obs;

  // 평가 선택하기
  void pickEvaluationCategoryEachUser(int idx, int selectedIdx) {
    int prev = -1;
    for (int i = 0; i < evaluateList[idx].selected.length; i++) {
      if (evaluateList[idx].selected[i]) {
        prev = i;
      }
    }

    if (prev == selectedIdx) {
      // 기존에 택한 것을 또 선택 => 선택 취소
      evaluateList[idx].content = "";
      evaluateList[idx].selected[prev] = false;
    } else {
      // 기존에 택하지 않은 걸 선택 => 선택 변경
      evaluateList[idx].content = evaluationCategory[selectedIdx];
      evaluateList[idx].selected[selectedIdx] = true;
      if (prev != -1) evaluateList[idx].selected[prev] = false;
    }
  }

  // 평가하기
  Future<void> evaluateUser() async {
    for (int i = 0; i < evaluateList.length; i++) {
      if (evaluateList[i].content == "") continue;

      Evaluation evaluation = evaluateList[i];
      print("${evaluation.accountId}, ${evaluation.content}");
      await repository.evaluateUser(evaluation.accountId, evaluation.content);
    }

    alreadyEvaluatingDone.value = true;
    update();
  }

  // 신고하기
  void reportUser(int accountId, String content) {
    repository.reportUser(accountId, content);
    alreadyReportingDone.value = true;
  }
}

const evaluationCategory = <String>[
  "시간 약속을 잘 지켜요",
  "친절해요",
  "응답이 빨라요",
];

class Evaluation {
  int accountId;
  String content;
  RxList<bool> selected = <bool>[false, false, false].obs;

  Evaluation(this.accountId, this.content);
}
