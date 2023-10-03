import 'package:cached_network_image/cached_network_image.dart';
import 'package:fibermart_admin/screens/homepage/widgets/flowerpot_order/controllers/ordercontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../../controller/homepageController.dart';
import '../dashborad/widgets/carddashbord.dart';

class Orders extends StatelessWidget {
  Orders({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
            width: Get.width,
            padding: const EdgeInsets.all(25),
            color: Constants().backColor,
            child: Get.find<OrderController>().isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const ListTile(
                          title: Text(
                            "Flowerpot Orders",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                          subtitle: Text(
                            "your customer Flowerpot orders",
                            style: TextStyle(color: Colors.black38),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GetBuilder<OrderController>(
                            init: Get.find<OrderController>(),
                            builder: (controller) => Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CardDashbord(
                                  title: "${controller.urgentOrder}",
                                  subtitle: "Urgent Orders",
                                  color: Colors.green,
                                  icon: Icons.shopping_cart,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                CardDashbord(
                                  title:
                                      "${controller.flowerPotOrders.value.length}",
                                  subtitle: "Total order",
                                  color: Colors.orange,
                                  icon: Icons.add_shopping_cart,
                                ),
                              ],
                            ),
                          ),
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
                                            child: GetBuilder<OrderController>(
                                              init: Get.find<OrderController>(),
                                              builder: (controller) {
                                                return PaginatedDataTable(
                                                    showCheckboxColumn: true,
                                                    rowsPerPage: 10,
                                                    columns: const [
                                                      DataColumn(
                                                          label: Text("Id")),
                                                      DataColumn(
                                                          label: Text("Logo")),
                                                      DataColumn(
                                                          label: Text(
                                                              "SelectedFlowerpot")),
                                                      DataColumn(
                                                          label:
                                                              Text("Quantity")),
                                                      DataColumn(
                                                          label: Text(
                                                              "SelectedEntityType")),
                                                      DataColumn(
                                                          label: Text(
                                                              "OrderName")),
                                                      DataColumn(
                                                          label: Text(
                                                              "OrderPhone")),
                                                      DataColumn(
                                                          label: Text(
                                                              "OrderAddress")),
                                                      DataColumn(
                                                          label: Text(
                                                              "OrderNote")),
                                                      DataColumn(
                                                          label: Text(
                                                              "IsUrgentDelivery")),
                                                      DataColumn(
                                                          label: Text(
                                                              "SelectedSales")),
                                                      DataColumn(
                                                          label:
                                                              Text("Discount")),
                                                      DataColumn(
                                                          label: Text(
                                                              "TotalPrice")),
                                                      DataColumn(
                                                          label: Text(
                                                              "CreatedAt")),
                                                      DataColumn(
                                                          label:
                                                              Text("Payments")),
                                                      DataColumn(
                                                          label: Text("")),
                                                    ],
                                                    source:
                                                        ProductDatatableSource(
                                                            controller:
                                                                controller));
                                              },
                                            )),
                                      ],
                                    ))
                              ],
                            ))
                      ],
                    ),
                  ))
        .animate()
        .fade(duration: const Duration(milliseconds: 200)));
  }
}

class ProductDatatableSource extends DataTableSource {
  OrderController controller;
  ProductDatatableSource({required this.controller});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(Get.find<OrderController>()
          .flowerPotOrders
          .value[index]
          .id
          .toString())),
      DataCell(controller.flowerPotOrders.value[index].hasLogo == true
          ? CachedNetworkImage(
              imageUrl: controller.flowerPotOrders.value[index].logoFilePath!,
              placeholder: (context, url) => FaIcon(
                FontAwesomeIcons.image,
                color: Constants().primColor,
              ),
              errorWidget: (context, url, error) => FaIcon(
                FontAwesomeIcons.image,
                color: Constants().primColor,
              ),
              width: 50,
              height: 50,
            )
          : FaIcon(
              FontAwesomeIcons.image,
              color: Constants().primColor,
            )),
      DataCell(Text(controller.flowerPotOrders.value[index].selectedFlowerpot
          .toString())),
      DataCell(
          Text(controller.flowerPotOrders.value[index].quantity.toString())),
      DataCell(Text(controller.flowerPotOrders.value[index].selectedEntityType
          .toString())),
      DataCell(
          Text(controller.flowerPotOrders.value[index].orderName.toString())),
      DataCell(
          Text(controller.flowerPotOrders.value[index].orderPhone.toString())),
      DataCell(Text(
          controller.flowerPotOrders.value[index].orderAddress.toString())),
      DataCell(
          Text(controller.flowerPotOrders.value[index].orderNote.toString())),
      DataCell(Text(
        controller.flowerPotOrders.value[index].isUrgentDelivery.toString(),
        style: TextStyle(
            color:
                controller.flowerPotOrders.value[index].isUrgentDelivery == true
                    ? Colors.green
                    : Colors.black,
            fontSize:
                controller.flowerPotOrders.value[index].isUrgentDelivery == true
                    ? 18
                    : 15),
      )),
      DataCell(Text(
          controller.flowerPotOrders.value[index].selectedSales.toString())),
      DataCell(
          Text(controller.flowerPotOrders.value[index].discount.toString())),
      DataCell(
          Text(controller.flowerPotOrders.value[index].totalPrice.toString())),
      DataCell(
          Text(controller.flowerPotOrders.value[index].createdAt.toString())),
      DataCell(
          Text(controller.flowerPotOrders.value[index].payments.toString())),
      const DataCell(
        Row(
          children: [
            Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            Text(
              "delete",
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.flowerPotOrders.value.length;

  @override
  int get selectedRowCount => 0;
}
