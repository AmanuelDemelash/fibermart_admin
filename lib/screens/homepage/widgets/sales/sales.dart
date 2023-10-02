
import 'package:fibermart_admin/screens/homepage/widgets/sales/controller/salescontroller.dart';
import 'package:fibermart_admin/screens/homepage/widgets/sales/widgets/addnewsaleform.dart';
import 'package:fibermart_admin/utils/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';

class Sales extends StatelessWidget {
  const Sales({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Obx(() =>
    Container(
        width: Get.width,
        padding:const EdgeInsets.all(25),
    color: Constants().backColor,
    child:Get.find<SalesController>().isLoading.value?const Center(child: CircularProgressIndicator(),):
     SingleChildScrollView(
    child: Column(
    children: [
     ListTile(
    title: const Text("Sales",style: TextStyle(fontSize: 25,),),
    subtitle:const Text("registered fibermart sales",style: TextStyle(color: Colors.black38),),
      trailing: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
              backgroundColor: Constants().primColor,
              elevation: 0,
              padding:const EdgeInsets.all(20)
          ),
          icon: const Icon(Icons.add,color: Colors.white,),
          onPressed:()async{
            Get.dialog(AlertDialog(
              elevation: 0,
              backgroundColor: Colors.white,
              contentPadding:const EdgeInsets.all(15),
              title: const Text("Add new Sales"),
              content:AddNewSaleForm(),
            ),
            barrierDismissible: false);
          }, label:Text("Add Sales",style: TextStyle(color: Constants().backColor),)),
    ),
    const SizedBox(height: 25,),
      Container(
            width: Get.width,
            padding:const EdgeInsets.only(left: 15,top: 20,right: 15),
            decoration: BoxDecoration(
                color: Constants().scafoldColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child:GetBuilder<SalesController>(
              init: Get.find<SalesController>(),
              builder:(controller) => SizedBox(
                width: Get.width,
                child: PaginatedDataTable(
                    showCheckboxColumn: true,
                    rowsPerPage:10,
                    arrowHeadColor: Constants().primColor,
                    columns:const [
                      DataColumn(label: Text("Id")),
                      DataColumn(label: Text("Name")),
                      DataColumn(label: Text("")),
                    ],
                    source: SalesDatatableSource(controller: controller)),
              ),),


        )
    ]
        )
    )
    )
    );
  }
}

class SalesDatatableSource extends DataTableSource {
  SalesController controller;
  SalesDatatableSource({required this.controller});
  @override
  DataRow? getRow(int index) {
    return  DataRow(cells: [
      DataCell(Text(controller.salesList.value[index].id.toString())),
      DataCell(Text(controller.salesList.value[index].name.toString())),
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
                  Text("are you deleting sale ${controller.salesList.value[index].name}"),
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
                   controller.deleteSales(index);
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
  int get rowCount =>controller.salesList.value.length;

  @override
  int get selectedRowCount => 0;
}