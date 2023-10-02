

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../api/user_sheet.dart';
import '../../../../models/bussiness_types.dart';

class CustomerController extends GetxController{
  RxBool isLoading =true.obs;
  RxBool isAddNewCustomer=false.obs;
  RxBool idDeleting=false.obs;
  Rx<List<CustomerTypes>> customerList=Rx<List<CustomerTypes>>([]);

  @override
  void onInit() {
    super.onInit();
    getCustomerList();
  }

  getCustomerList()async{
    isLoading.value=true;
    customerList.value= (await UserSheet.getCustomerTypes())!;
    if(customerList.value.isEmpty){
      isLoading.value=true;
    }
    isLoading.value=false;
  }
  addCustomer(CustomerTypes customer)async{
    isAddNewCustomer.value=true;
    CustomerTypes result=await UserSheet.addNewCustomer(customer);
    if(result.id.isNotEmpty){
      isAddNewCustomer.value=false;
      customerList.value.add(customer);
      update();
      getSnackbar("Customer type added");
    }

  }

  deleteCustomertype(int index)async{
    idDeleting.value=true;
    var result=await UserSheet.deleteCustomer(index);
    if(result){
      idDeleting.value=false;
      customerList.value.remove(customerList.value[index]);
      update();
      getSnackbar("Customer type deleted");
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