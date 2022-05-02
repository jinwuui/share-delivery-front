import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_delivery/src/controller/delivery_room_register/delivery_room_register_controller.dart';

class PickStoreCategory extends GetView<DeliveryRoomRegisterController> {
  const PickStoreCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      height: Get.height * 0.6,
      child: storeCategory(),
    );
  }

  Widget storeCategory() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 30,
        ),
        Container(
          width: double.infinity,
          height: 45,
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.black12, width: 1))),
          child: Stack(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_rounded),
                onPressed: () => Get.back(),
              ),
              Center(
                child: Text(
                  "가게 카테고리 설정",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.grey.shade200,
            child: GridView.builder(
              itemCount: controller.storeCategories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return category(index);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget category(int index) {
    String _storeCategory = controller.storeCategories[index].keys.first;

    return GestureDetector(
      onTap: () {
        print(controller.storeCategories[index][_storeCategory]);
        controller.setPickedStoreCategory(index);
        Get.back();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Text(
            _storeCategory,
            style: TextStyle(
              fontSize: _storeCategory.length < 4 ? 20 : 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
