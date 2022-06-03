import 'package:flutter/material.dart';
import 'package:get/get.dart';

final whiteBtn = OutlinedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
  primary: Colors.black,
  textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
  elevation: 0,
  backgroundColor: Colors.white,
  fixedSize: Size(Get.width * 0.7, Get.height * 0.05),
);

final orangeBtn = ElevatedButton.styleFrom(
  primary: Colors.orange,
  textStyle: const TextStyle(fontSize: 17),
  elevation: 0,
  fixedSize: Size(Get.width * 0.7, Get.height * 0.05),
);

final orangeFlexBtn = ElevatedButton.styleFrom(
  primary: Colors.deepOrange,
  textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
  elevation: 0,
);

final greyBtn = ElevatedButton.styleFrom(
  primary: Colors.grey.shade700,
  textStyle: const TextStyle(fontSize: 17),
  elevation: 0,
  fixedSize: Size(Get.width * 0.7, Get.height * 0.05),
);

final commentBtn = TextButton.styleFrom(
  padding: EdgeInsets.zero,
  minimumSize: const Size(50, 30),
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  alignment: Alignment.centerLeft,
  primary: Colors.grey.shade700,
  textStyle: const TextStyle(
    fontWeight: FontWeight.w800,
  ),
);

final unlikedCommentBtn = TextButton.styleFrom(
  padding: EdgeInsets.zero,
  minimumSize: const Size(50, 30),
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  splashFactory: NoSplash.splashFactory,
  alignment: Alignment.centerLeft,
  primary: Colors.grey.shade700,
  textStyle: const TextStyle(
    fontWeight: FontWeight.w800,
  ),
);

final likedCommentBtn = TextButton.styleFrom(
  padding: EdgeInsets.zero,
  minimumSize: const Size(50, 30),
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  splashFactory: NoSplash.splashFactory,
  alignment: Alignment.centerLeft,
  primary: Colors.orange,
  textStyle: const TextStyle(
    fontWeight: FontWeight.w800,
  ),
);

final unselectedPostCategoryBtn = ElevatedButton.styleFrom(
  textStyle: const TextStyle(fontWeight: FontWeight.w600),
  elevation: 0,
  primary: Colors.white,
  onPrimary: Colors.grey.shade700,
  side: BorderSide(color: Colors.grey.shade300),
);

final selectedPostCategoryBtn = ElevatedButton.styleFrom(
  textStyle: const TextStyle(fontWeight: FontWeight.w600),
  elevation: 0,
  primary: Colors.orangeAccent,
  onPrimary: Colors.white,
  side: BorderSide(color: Colors.orange),
);

final cancelBtn = ElevatedButton.styleFrom(
  splashFactory: NoSplash.splashFactory,
  primary: Colors.white,
  onPrimary: Colors.black,
  side: BorderSide(
    width: 1.0,
    color: Colors.black26,
  ),
  textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
  elevation: 0,
);

final deleteBtn = ElevatedButton.styleFrom(
  splashFactory: NoSplash.splashFactory,
  primary: Colors.orangeAccent,
  onPrimary: Colors.white,
  textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
  elevation: 0,
);
