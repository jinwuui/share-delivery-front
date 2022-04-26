import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OrderFormRegisterController extends GetxController {
  OrderFormRegisterController();

  final orderFormList = <XFile>[].obs;

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();

    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      List<XFile> newList = [image!, ...orderFormList];

      if (newList.length > 2) {
        throw Exception("사진 개수 초과");
      }

      orderFormList.value = newList;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> deleteImage(String imageURL) async {
    orderFormList.value =
        orderFormList.where(((element) => element.path != imageURL)).toList();
  }
  // final deliveryTime = DateTime.now().obs;

  // Future<void> updateDeliveryTime(int minute) async {
  //   DateTime newDate = DateTime.utc(
  //       deliveryTime.value.year,
  //       deliveryTime.value.month,
  //       deliveryTime.value.day,
  //       deliveryTime.value.hour,
  //       deliveryTime.value.minute + minute);

  //   try {
  //     deliveryTime.value = newDate;
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
