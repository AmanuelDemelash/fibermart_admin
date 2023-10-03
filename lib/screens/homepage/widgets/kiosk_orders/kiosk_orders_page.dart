import 'package:cached_network_image/cached_network_image.dart';
import 'package:fibermart_admin/screens/homepage/widgets/kiosk_orders/controller/kiosk_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../controller/homepageController.dart';
import '../dashborad/widgets/carddashbord.dart';

class KioskOrders extends StatelessWidget {
  KioskOrders({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
            width: Get.width,
            padding: const EdgeInsets.all(25),
            color: Constants().backColor,
            child: Get.find<KioskOrderController>().isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const ListTile(
                          title: Text(
                            "Kiosk Orders",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          subtitle: Text(
                            "your customer Kiosk Orders",
                            style: TextStyle(color: Colors.black38),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CardDashbord(
                              title: "20",
                              subtitle: "Urgent Orders",
                              color: Colors.green,
                              icon: Icons.shopping_cart,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            CardDashbord(
                              title:
                                  "${Get.find<KioskOrderController>().kioskOrders.value.length}",
                              subtitle: "Total order",
                              color: Colors.orange,
                              icon: Icons.add_shopping_cart,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                            width: Get.width,
                            padding: const EdgeInsets.only(
                                left: 15, top: 20, right: 15),
                            decoration: BoxDecoration(
                                color: Constants().scafoldColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // tab
                                SizedBox(
                                    width: Get.width,
                                    child: Obx(
                                      () => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: List.generate(3, (index) {
                                          return GestureDetector(
                                            onTap: () =>
                                                Get.find<HomepageController>()
                                                    .selectedIndex
                                                    .value = index,
                                            child: AnimatedContainer(
                                              duration:
                                                  const Duration(seconds: 100),
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              child: Center(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      Get.find<HomepageController>()
                                                              .orderSelectionToggle[
                                                          index],
                                                      style: TextStyle(
                                                        fontSize: Get.find<
                                                                        HomepageController>()
                                                                    .selectedIndex
                                                                    .value ==
                                                                index
                                                            ? 17
                                                            : 13,
                                                        fontWeight: Get.find<
                                                                        HomepageController>()
                                                                    .selectedIndex
                                                                    .value ==
                                                                index
                                                            ? FontWeight.bold
                                                            : FontWeight.normal,
                                                        color: Get.find<HomepageController>()
                                                                    .selectedIndex
                                                                    .value ==
                                                                index
                                                            ? Constants()
                                                                .primColor
                                                            : Colors.black54,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 100,
                                                      height: 4,
                                                      color: Get.find<HomepageController>()
                                                                  .selectedIndex
                                                                  .value ==
                                                              index
                                                          ? Constants()
                                                              .primColor
                                                          : Constants()
                                                              .scafoldColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Obx(() => IndexedStack(
                                      index: Get.find<HomepageController>()
                                          .selectedIndex
                                          .value,
                                      children: [
                                        SizedBox(
                                          width: Get.width,
                                          child: PaginatedDataTable(
                                              showCheckboxColumn: true,
                                              rowsPerPage: 10,
                                              columns: const [
                                                DataColumn(label: Text("Id")),
                                                DataColumn(
                                                    label:
                                                        Text("SelectedKiosk")),
                                                DataColumn(
                                                    label:
                                                        Text("SelectedColor")),
                                                DataColumn(
                                                    label: Text("Quantity")),
                                                DataColumn(
                                                    label: Text("UseCase")),
                                                DataColumn(
                                                    label: Text(
                                                        "RequestingEntityType")),
                                                DataColumn(
                                                    label: Text("OrderName")),
                                                DataColumn(
                                                    label: Text("OrderPhone")),
                                                DataColumn(
                                                    label:
                                                        Text("OrderAddress")),
                                                DataColumn(
                                                    label: Text("OrderNote")),
                                                DataColumn(
                                                    label:
                                                        Text("SelectedSales")),
                                                DataColumn(
                                                    label: Text("CreatedAt")),
                                                DataColumn(
                                                    label: Text("Payments")),
                                                DataColumn(
                                                    label: Text("Production")),
                                                DataColumn(label: Text("")),
                                              ],
                                              source: ProductDatatableSource()),
                                        ),
                                      ],
                                    ))
                              ],
                            ))
                      ],
                    ),
                  ))
        .animate()
        .slideX());
  }
}

class ProductDatatableSource extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(Get.find<KioskOrderController>()
          .kioskOrders
          .value[index]
          .id
          .toString())),
      DataCell(Text(Get.find<KioskOrderController>()
          .kioskOrders
          .value[index]
          .selectedKiosk
          .toString())),
      DataCell(Text(Get.find<KioskOrderController>()
          .kioskOrders
          .value[index]
          .selectedColor
          .toString())),
      DataCell(Text(Get.find<KioskOrderController>()
          .kioskOrders
          .value[index]
          .quantity
          .toString())),
      DataCell(Text(Get.find<KioskOrderController>()
          .kioskOrders
          .value[index]
          .useCase
          .toString())),
      DataCell(Text(Get.find<KioskOrderController>()
          .kioskOrders
          .value[index]
          .requestingEntityType
          .toString())),
      DataCell(Text(Get.find<KioskOrderController>()
          .kioskOrders
          .value[index]
          .orderName
          .toString())),
      DataCell(Text(Get.find<KioskOrderController>()
          .kioskOrders
          .value[index]
          .orderPhone
          .toString())),
      DataCell(Text(Get.find<KioskOrderController>()
          .kioskOrders
          .value[index]
          .orderAddress
          .toString())),
      DataCell(Text(Get.find<KioskOrderController>()
          .kioskOrders
          .value[index]
          .orderNote
          .toString())),
      DataCell(Text(Get.find<KioskOrderController>()
          .kioskOrders
          .value[index]
          .selectedSales
          .toString())),
      DataCell(Text(Get.find<KioskOrderController>()
          .kioskOrders
          .value[index]
          .createdAt
          .toString())),
      DataCell(Text(Get.find<KioskOrderController>()
          .kioskOrders
          .value[index]
          .payments
          .toString())),
      DataCell(Text(Get.find<KioskOrderController>()
          .kioskOrders
          .value[index]
          .production
          .toString())),
      DataCell(
        IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever)),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => Get.find<KioskOrderController>().kioskOrders.value.length;

  @override
  int get selectedRowCount => 0;
}
