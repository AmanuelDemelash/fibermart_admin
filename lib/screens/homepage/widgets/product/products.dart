
import 'package:fibermart_admin/screens/homepage/widgets/product/productcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/widgets/loading.dart';
import '../../controller/homepageController.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Container(
              width: Get.width,
              padding:const EdgeInsets.all(25),
              color: Constants().backColor,
              child:SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                          title: const Text("Product",style: TextStyle(fontSize:25,),),
                          subtitle: const Text("product in stock",style: TextStyle(color: Colors.black38),),
                          trailing:
                          ElevatedButton.icon(
                            label: Text("Add product",style: TextStyle(color: Constants().backColor),),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Constants().primColor,
                                elevation: 0,
                                padding:const EdgeInsets.all(20)
                            ),
                            onPressed:() {
                            }, icon:const Icon(Icons.add,color: Colors.white,),
                          ),
                        ),
                        const SizedBox(height: 25,),
                        Container(
                          width: Get.width,
                          padding:const EdgeInsets.only(left: 15,top: 20,right: 15),
                          decoration: BoxDecoration(
                              color: Constants().scafoldColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: Get.width,
                                  child: Obx(
                                        () => Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: List.generate(2, (index) {
                                        return
                                          GestureDetector(
                                            onTap: () =>Get.find<ProductController>().selectedIndex
                                                .value = index,
                                            child: AnimatedContainer(
                                              duration:
                                              const Duration(seconds:100),
                                              margin:const EdgeInsets.only(right: 10),
                                              child: Center(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text( Get.find<ProductController>().orderSelectionToggle[index],
                                                      style: TextStyle(
                                                        fontSize: Get.find<ProductController>().selectedIndex
                                                            .value ==
                                                            index
                                                            ? 17
                                                            : 13,
                                                        fontWeight: Get.find<ProductController>().selectedIndex
                                                            .value ==
                                                            index
                                                            ? FontWeight.bold
                                                            : FontWeight.normal,
                                                        color:
                                                        Get.find<ProductController>().selectedIndex
                                                            .value ==
                                                            index
                                                            ? Constants().primColor
                                                            : Colors.black54,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 100,
                                                      height:4,
                                                      color:  Get.find<ProductController>().selectedIndex
                                                          .value ==
                                                          index
                                                          ? Constants().primColor
                                                          : Constants().scafoldColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                      }),
                                    ),
                                  )),
                              const SizedBox(height: 20,),
                              GetBuilder<ProductController>(
                                init: Get.find<ProductController>(),
                                builder:(controller) => SizedBox(
                                  width: Get.width,
                                  child: PaginatedDataTable(
                                      showCheckboxColumn: true,
                                      rowsPerPage:10,
                                      arrowHeadColor: Constants().primColor,
                                      columns:const [
                                        DataColumn(label: Text("Id")),
                                        DataColumn(label: Text("Name")),
                                        DataColumn(label: Text("Price")),
                                        DataColumn(label: Text("")),
                                      ],
                                      source: ProductDatatableSource(controller: controller)),
                                ),),
                            ],
                          ),

                        )
                      ]
                  )
              )
          ).animate().fade(duration:const Duration(milliseconds: 200))
    ;
  }
}


class ProductDatatableSource extends DataTableSource {
  ProductController controller;
  ProductDatatableSource({required this.controller});
  @override
  DataRow? getRow(int index) {
    return  DataRow(cells: [
      DataCell(Text(controller.flowerpotList.value[index].id.toString())),
      DataCell(Text(controller.flowerpotList.value[index].name.toString())),
      DataCell(Text("ETB ${controller.flowerpotList.value[index].price.toString()}")),
      DataCell(
          InkWell(
            onTap:() {
              Get.dialog(AlertDialog(
                elevation: 0,
                backgroundColor: Colors.white,
                contentPadding:const EdgeInsets.all(15),
                title: const Text("Deleting Sales"),
                titleTextStyle:const TextStyle(fontSize: 15,color: Colors.red),
                content:SizedBox(
                  width: 300,
                  height:100,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("are you deleting sale ${controller.flowerpotList.value[index].name}"),
                      Obx(() =>controller.idDeleting.value?const Loading():const Text(""))
                    ],
                  ),
                ),
                actions: [
                  InkWell(
                      onTap:(){
                        Get.back();
                      }, child: const Text("Cancel")),
                  const SizedBox(width: 20,),
                  InkWell(
                      onTap:(){
                        //controller.deleteSales(index);
                        Get.back();
                      },
                      child: const Text("Yes",style: TextStyle(color: Colors.red),))
                ],
              ),
                  barrierDismissible: false);
            },
            child: const Row(
              children:[Icon(Icons.delete_forever,color: Colors.red,),Text("delete",style: TextStyle(color: Colors.red),)],
            ),

          )
      )

    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount =>controller.flowerpotList.value.length;

  @override
  int get selectedRowCount => 0;
}