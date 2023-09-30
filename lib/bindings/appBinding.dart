

import 'package:fibermart_admin/controllers/connectivityControllers.dart';
import 'package:fibermart_admin/screens/homepage/controller/homepageController.dart';
import 'package:fibermart_admin/screens/homepage/widgets/order/controllers/ordercontroller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(HomepageController());
    Get.put(ConnectivityControllers());
    Get.put(OrderController());
  }

}