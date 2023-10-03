

import 'package:fibermart_admin/models/flowerpots.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api/user_sheet.dart';

class ProductController extends GetxController{
  RxInt selectedIndex=0.obs;
  List<String> orderSelectionToggle=["FlowerPot","Kiosk"];

  RxBool isLoading =true.obs;
  RxBool isAddNewProduct=false.obs;
  RxBool idDeleting=false.obs;
  Rx<List<Flowerpot>> flowerpotList=Rx<List<Flowerpot>>([]);

  @override
  void onInit() {
    super.onInit();
    getFlowerPotList();
  }
   // flowerpot
  getFlowerPotList()async{
    isLoading.value=true;
    flowerpotList.value= (await UserSheet.getFPList())!;
    if(flowerpotList.value.isEmpty){
      isLoading.value=true;
    }
    isLoading.value=false;
  }
  addFp(Flowerpot flowerpot)async{
    isAddNewProduct.value=true;
    Flowerpot result=await UserSheet.addNewFp(flowerpot);
    if(result.id.isNotEmpty){
      isAddNewProduct.value=false;
      flowerpotList.value.add(flowerpot);
      update();
      getSnackbar("FlowerPot type added");
    }

  }
  deleteFp(int index)async{
    idDeleting.value=true;
    var result=await UserSheet.deleteFp(index);
    if(result){
      idDeleting.value=false;
      flowerpotList.value.remove(flowerpotList.value[index]);
      update();
      getSnackbar("Flowerpot  deleted");
    }

  }

  // kisok

  getSnackbar(String message){
    Get.snackbar("Success", message,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        margin: EdgeInsets.only(left: 20,top: 20,right: Get.width/2.5)
    );
  }


}