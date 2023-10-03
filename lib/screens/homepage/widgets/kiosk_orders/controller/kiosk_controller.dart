import 'package:fibermart_admin/models/kioskForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../api/user_sheet.dart';
import '../../../../../models/flowerpotform.dart';

class KioskOrderController extends GetxController {
  RxBool isLoading = true.obs;
  Rx<List<KioskOrderModel>> kioskOrders = Rx<List<KioskOrderModel>>([]);

  @override
  void onInit() {
    super.onInit();
    getKioskPotOrders();
  }

  getKioskPotOrders() async {
    isLoading.value = true;
    kioskOrders.value = (await UserSheet.getKioskOrderList())!;
    if (kioskOrders.value.isEmpty) {
      isLoading.value = true;
    }
    isLoading.value = false;
    print(kioskOrders.value.length);
  }
}
