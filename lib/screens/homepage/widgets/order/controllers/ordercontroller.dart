
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../api/user_sheet.dart';
import '../../../../../models/flowerpotform.dart';

class OrderController extends GetxController{
  RxBool isLoading =true.obs;
  Rx<List<FlowerpotFormModel>> flowerPotOrders=Rx<List<FlowerpotFormModel>>([]);

  @override
  void onInit() {
    super.onInit();
    getFlowerPotOrders();
  }

  getFlowerPotOrders()async{
    isLoading.value=true;
    flowerPotOrders.value= (await UserSheet.getordersList())!;
    if(flowerPotOrders.value.isEmpty){
      isLoading.value=true;
    }
    isLoading.value=false;

  }

}