import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../api/user_sheet.dart';
import '../../../../../models/flowerpotform.dart';

class OrderController extends GetxController {
  RxInt urgentOrder = 0.obs;
  RxBool isLoading = true.obs;
  Rx<List<FlowerpotFormModel>> flowerPotOrders =
      Rx<List<FlowerpotFormModel>>([]);
  Rx<List<FlowerpotFormModel>> urgentFlowerPotOrders =
      Rx<List<FlowerpotFormModel>>([]);

  @override
  void onInit() {
    super.onInit();
    getFlowerPotOrders();
  }

  getFlowerPotOrders() async {
    isLoading.value = true;
    flowerPotOrders.value = (await UserSheet.getordersList())!;
    if (flowerPotOrders.value.isEmpty) {
      isLoading.value = true;
    }
    isLoading.value = false;
    getUrgentOrder();
  }

  Future<void> getUrgentOrder() async {
    for (int i = 0; i <= flowerPotOrders.value.length; i++) {
      if (flowerPotOrders.value[i].isUrgentDelivery == true) {
        urgentOrder.value++;
        urgentFlowerPotOrders.value.add(flowerPotOrders.value[i]);
      }
    }
    update();
  }
}
