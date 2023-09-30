

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityControllers extends GetxController{

  RxBool isConnected=false.obs;

 @override
  void onInit()async{
    // TODO: implement onInit
    super.onInit();
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      isConnected.value=true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      isConnected.value=true;
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      // I am connected to a ethernet network.
      isConnected.value=true;
    } else if (connectivityResult == ConnectivityResult.vpn) {
      isConnected.value=true;
    }  else if (connectivityResult == ConnectivityResult.none) {
      isConnected.value=false;
       Get.snackbar("Connection lost", "please cheek your connection",
           colorText: Colors.white,
           duration: const Duration(seconds:10),
           padding: const EdgeInsets.all(10),
           isDismissible: true,
           icon:const FaIcon(FontAwesomeIcons.wifi,color: Colors.white,),
           margin: EdgeInsets.only(left: 20,top: 20,right: Get.width/2),
           backgroundColor:Colors.red
       );
    }
    // subscribe netework state
    var subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile) {
        isConnected.value=true;
      } else if (result == ConnectivityResult.wifi) {
        // I am connected to a wifi network.
        isConnected.value=true;
      } else if (result == ConnectivityResult.ethernet) {
        // I am connected to a ethernet network.
        isConnected.value=true;
      } else if (result == ConnectivityResult.vpn) {
        isConnected.value=true;
      }  else if (result == ConnectivityResult.none) {
        isConnected.value=false;
        Get.snackbar("Connection lost", "please cheek your connection",
            colorText: Colors.white,
            duration: const Duration(seconds:10),
            padding: const EdgeInsets.all(10),
            isDismissible: true,
            icon:const FaIcon(FontAwesomeIcons.wifi,color: Colors.white,),
            margin: EdgeInsets.only(left: 20,top: 20,right: Get.width/2),
            backgroundColor:Colors.red
        );
      }
    });

  }




}