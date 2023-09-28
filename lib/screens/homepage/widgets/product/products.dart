
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        padding:const EdgeInsets.all(25),
    color: Constants().backColor,
    child:SingleChildScrollView(
    child: Column(
    children: [
      ListTile(
    title: const Text("Product",style: TextStyle(fontSize: 25,),),
    subtitle:const Text("product in stock",style: TextStyle(color: Colors.black38),),
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
          child: Column(
            children: [
              PaginatedDataTable(
                  header:const Row(
                    children: [
                     Text("100 Products",style: TextStyle(fontSize: 14),),
                      SizedBox(width: 12,),
                ],),
                actions: [
                ],
                showCheckboxColumn: true,
                rowsPerPage: 10,
                arrowHeadColor: Constants().primColor,
                columns:const [
                DataColumn(label: Text("Id"),),
                  DataColumn(label: Text("Image")),
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Description")),
                DataColumn(label: Text("Price")),
                DataColumn(label: Text("Quantity")),

              ], source: ProductDatatableSource())
            ],
          ),
        )


    ]
    ))).animate().slideX()
    ;
  }
}

class ProductDatatableSource extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return const DataRow(cells: [
      DataCell(Text("245")),
      DataCell(Text("image")),
      DataCell(Text("Iphone 13")),
      DataCell(Text("Iphone13 256Gb 6gb ram")),
      DataCell(Text("ETB 45000")),
      DataCell(Text("6")),
    ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount =>20;

  @override
  int get selectedRowCount => 0;
}
