

import 'package:fibermart_admin/screens/homepage/controller/homepageController.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(HomepageController());
  }

}