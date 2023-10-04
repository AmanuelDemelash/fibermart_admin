import 'package:cached_network_image/cached_network_image.dart';
import 'package:fibermart_admin/screens/homepage/widgets/customer/customercontroller.dart';
import 'package:fibermart_admin/screens/homepage/widgets/dashborad/widgets/carddashbord.dart';
import 'package:fibermart_admin/screens/homepage/widgets/dashborad/widgets/linechart.dart';
import 'package:fibermart_admin/screens/homepage/widgets/dashborad/widgets/pichart.dart';
import 'package:fibermart_admin/screens/homepage/widgets/flowerpot_order/controllers/ordercontroller.dart';
import 'package:fibermart_admin/screens/homepage/widgets/product/productcontroller.dart';
import 'package:fibermart_admin/screens/homepage/widgets/sales/controller/salescontroller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';

class HomeDashborad extends StatelessWidget {
  const HomeDashborad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        padding: const EdgeInsets.all(25),
        color: Constants().backColor,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const ListTile(
                title: Text(
                  "Dashboard",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                subtitle: Text(
                  "welcome to your dashboard",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder<OrderController>(
                          init: Get.find<OrderController>(),
                          builder: (controller) => CardDashbord(
                                title:
                                    "${controller.flowerPotOrders.value.length}",
                                subtitle: "Order received",
                                color: Colors.green,
                                icon: Icons.add_shopping_cart,
                              )),
                      GetBuilder<SalesController>(
                        init: Get.find<SalesController>(),
                        builder: (controller) => CardDashbord(
                            title: "${controller.salesList.value.length}",
                            subtitle: "Total sales",
                            color: Colors.deepPurple,
                            icon: Icons.people),
                      ),
                      GetBuilder<ProductController>(
                        init: Get.find<ProductController>(),
                        builder: (controller) => CardDashbord(
                          title: "${controller.flowerpotList.value.length}",
                          subtitle: "Total Products",
                          color: Colors.orange,
                          icon: Icons.shopping_cart,
                        ),
                      ),
                      GetBuilder<CustomerController>(
                        init: Get.find<CustomerController>(),
                        builder: (controller) => CardDashbord(
                            title: "${controller.customerList.value.length}",
                            subtitle: "Total customer",
                            color: Constants().primColor,
                            icon: Icons.people),
                      ),
                      GetBuilder<OrderController>(
                        init: Get.find<OrderController>(),
                        builder: (controller) => CardDashbord(
                          title: controller.urgentOrder.value.toString(),
                          subtitle: "Urgent order",
                          color: Colors.redAccent,
                          icon: Icons.check_circle,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // statics
              Row(
                children: [
                  Container(
                      height: 360,
                      width: Get.width / 2,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Constants().scafoldColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                          height: 400,
                          width: Get.width / 2,
                          child: LineChartt())),
                  Expanded(
                    child: Container(
                        height: 360,
                        margin: const EdgeInsets.only(left: 15),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Constants().scafoldColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: PieChartSample2()),
                  )
                ].animate(interval: 400.ms).fade(duration: 300.ms),
              ),
              const SizedBox(
                height: 20,
              ),
              // urgent orders
              Container(
                  width: Get.width,
                  padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
                  decoration: BoxDecoration(
                      color: Constants().scafoldColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Urgent Orders",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          width: Get.width,
                          child: GetBuilder<OrderController>(
                              init: Get.find<OrderController>(),
                              builder: (controller) => controller
                                          .urgentOrder.value ==
                                      0
                                  ? const Text("No any urgent order yet")
                                  : PaginatedDataTable(
                                      showCheckboxColumn: true,
                                      rowsPerPage: 7,
                                      columns: const [
                                        DataColumn(label: Text("Id")),
                                        DataColumn(label: Text("Logo")),
                                        DataColumn(
                                            label: Text("SelectedFlowerpot")),
                                        DataColumn(label: Text("Quantity")),
                                        DataColumn(
                                            label: Text("SelectedEntityType")),
                                        DataColumn(label: Text("OrderName")),
                                        DataColumn(label: Text("OrderPhone")),
                                        DataColumn(label: Text("OrderAddress")),
                                        // DataColumn(label: Text("OrderNote")),
                                        DataColumn(
                                            label: Text("IsUrgentDelivery")),
                                        // DataColumn(label: Text("SelectedSales")),
                                        // DataColumn(label: Text("Discount")),
                                        DataColumn(label: Text("TotalPrice")),
                                        DataColumn(label: Text("CreatedAt")),
                                        DataColumn(label: Text("Payments")),
                                      ],
                                      source: ProductDatatableSource(
                                          controller: controller)))),
                    ],
                  ))
            ],
          ),
        )).animate().fade(duration: const Duration(milliseconds: 200));
  }
}

class ProductDatatableSource extends DataTableSource {
  OrderController controller;
  ProductDatatableSource({required this.controller});
  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(Get.find<OrderController>()
          .urgentFlowerPotOrders
          .value[index]
          .id
          .toString())),
      DataCell(controller.urgentFlowerPotOrders.value[index].hasLogo == true
          ? CachedNetworkImage(
              imageUrl:
                  controller.urgentFlowerPotOrders.value[index].logoFilePath!,
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
      DataCell(Text(controller
          .urgentFlowerPotOrders.value[index].selectedFlowerpot
          .toString())),
      DataCell(Text(
          controller.urgentFlowerPotOrders.value[index].quantity.toString())),
      DataCell(Text(controller
          .urgentFlowerPotOrders.value[index].selectedEntityType
          .toString())),
      DataCell(Text(
          controller.urgentFlowerPotOrders.value[index].orderName.toString())),
      DataCell(Text(
          controller.urgentFlowerPotOrders.value[index].orderPhone.toString())),
      DataCell(Text(controller.urgentFlowerPotOrders.value[index].orderAddress
          .toString())),
      // DataCell(Text(controller.urgentFlowerPotOrders.value[index].orderNote.toString())),
      DataCell(Text(
        controller.urgentFlowerPotOrders.value[index].isUrgentDelivery
            .toString(),
        style: TextStyle(
            color: controller
                        .urgentFlowerPotOrders.value[index].isUrgentDelivery ==
                    true
                ? Colors.green
                : Colors.black,
            fontSize: controller
                        .urgentFlowerPotOrders.value[index].isUrgentDelivery ==
                    true
                ? 18
                : 15),
      )),
      // DataCell(Text(controller.urgentFlowerPotOrders.value[index].selectedSales.toString())),
      // DataCell(Text(controller.urgentFlowerPotOrders.value[index].discount.toString())),
      DataCell(Text(
          controller.urgentFlowerPotOrders.value[index].totalPrice.toString())),
      DataCell(Text(
          controller.urgentFlowerPotOrders.value[index].createdAt.toString())),
      DataCell(Text(
          controller.urgentFlowerPotOrders.value[index].payments.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.urgentFlowerPotOrders.value.length;

  @override
  int get selectedRowCount => 0;
}
