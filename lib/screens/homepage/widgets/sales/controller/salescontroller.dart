
import 'package:fibermart_admin/models/sales.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../api/user_sheet.dart';

class SalesController extends GetxController{
  RxBool isLoading =true.obs;
  RxBool isAddNewSales=false.obs;
  RxBool idDeleting=false.obs;
  Rx<List<SalesTeam>> salesList=Rx<List<SalesTeam>>([]);

  @override
  void onInit() {
    super.onInit();
    getSaleList();
  }


  getSaleList()async{
    isLoading.value=true;
    salesList.value= (await UserSheet.getSalesList())!;
    if(salesList.value.isEmpty){
    isLoading.value=true;
    print(salesList.value);
    }
    isLoading.value=false;
  }

  addSales(SalesTeam sales)async{
    isAddNewSales.value=true;
    SalesTeam result=await UserSheet.addNewSales(sales);
    if(result.id.isNotEmpty){
      isAddNewSales.value=false;
      salesList.value.add(sales);
      update();
      getSnackbar("Sales added");

    }

  }

  deleteSales(int index)async{
    idDeleting.value=true;
    var result=await UserSheet.deleteSales(index);
    if(result){
      idDeleting.value=false;
      salesList.value.remove(salesList.value[index]);
      update();
      getSnackbar("Sales deleted");
    }

  }

  getSnackbar(String message){
    Get.snackbar("Success", message,
    backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: EdgeInsets.only(left: 20,top: 20,right: Get.width/2.5)
    );
  }
}