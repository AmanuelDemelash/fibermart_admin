
import 'package:fibermart_admin/screens/homepage/widgets/product/productcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/widgets/loading.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Constants().backColor,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace:const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product",style: TextStyle(fontSize:25,),),
                Text("product in stock",style: TextStyle(color: Colors.black38,fontSize: 17),),
              ],
            ),
          ),
           backgroundColor: Constants().backColor,
          automaticallyImplyLeading: false,

          bottom: TabBar(
              tabs:const[
            Tab(text: "Flower pot",),
            Tab(text: "Kiosk",)
          ],
            indicatorColor: Constants().primColor,
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.label,
          ),
        ),
        body:TabBarView(children:[
          Container(
              width: Get.width,
              padding:const EdgeInsets.all(25),
              child:SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
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

                        )
                      ]
                  )
              )
          ).animate().slideX(),
          Container()
        ])

      ),
    )
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
      DataCell(Text("ETB${controller.flowerpotList.value[index].price.toString()}")),
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