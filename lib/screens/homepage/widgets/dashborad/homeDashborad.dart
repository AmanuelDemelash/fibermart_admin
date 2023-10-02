
import 'package:fibermart_admin/screens/homepage/widgets/customer/customercontroller.dart';
import 'package:fibermart_admin/screens/homepage/widgets/dashborad/widgets/carddashbord.dart';
import 'package:fibermart_admin/screens/homepage/widgets/order/controllers/ordercontroller.dart';
import 'package:fibermart_admin/screens/homepage/widgets/sales/controller/salescontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';

class HomeDashborad extends StatelessWidget {
  const HomeDashborad({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Container(
      width: Get.width,
        padding:const EdgeInsets.all(25),
        color: Constants().backColor,
        child:
           SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: const Text("Dashboard",style: TextStyle(fontSize: 25,),),
                subtitle:const Text("welcome to your dashboard",style: TextStyle(color: Colors.black38),),
                trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Constants().primColor,
                        elevation: 0,
                        padding:const EdgeInsets.all(20)
                    ),
                    onPressed:() {

                    }, child:Text("Add product",style: TextStyle(color: Constants().backColor),)),
              ),
              const SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GetBuilder<OrderController>(
                      init: Get.find<OrderController>(),
                        builder:(controller) =>
                        CardDashbord(title: "${controller.flowerPotOrders.value.length}",subtitle: "Order received",color: Colors.green,icon: Icons.shopping_cart,)),
                   GetBuilder<SalesController>(
                   init: Get.find<SalesController>(),
                     builder:(controller) => CardDashbord(title: "${controller.salesList.value.length}",subtitle: "Total sales",color: Colors.deepPurple,icon: Icons.people),),
                    GetBuilder<CustomerController>(
                      init: Get.find<CustomerController>(),
                      builder:(controller) =>CardDashbord(title: "${controller.customerList.value.length}",subtitle: "Total customer",color: Constants().primColor,icon: Icons.people),),
                    CardDashbord(title: "123",subtitle: "Pending order",color: Colors.orange,icon: Icons.add_shopping_cart,),
                    CardDashbord(title: "60",subtitle: "Completed order",color: Colors.redAccent,icon: Icons.check_circle,)
                  ],
                ),
              ),
             const SizedBox(height: 20,),
            // statics
              Row(
                children: [
                 Container(
                      height: 400,
                      width: Get.width/2,
                      padding:const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Constants().scafoldColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child:const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sale statics",style: TextStyle(fontSize: 20),)
                        ],
                      )
                    ),
                  Expanded(
                    child: Container(
                        height: 400,
                        margin:const EdgeInsets.only(left: 15),
                        padding:const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Constants().scafoldColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child:const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Most Celling\n category",style: TextStyle(fontSize: 20),)
                          ],
                        )
                    ),
                  )
                ].animate(interval: 400.ms).fade(duration: 300.ms),
              ),
              const SizedBox(height: 20,),
              // recent orders
              Container(
                width: Get.width,
                  padding:const EdgeInsets.only(left: 15,top: 20,right: 15),
                  decoration: BoxDecoration(
                      color: Constants().scafoldColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Recent Completed Orders",style: TextStyle(fontSize:18),),
                    const SizedBox(height:20,),
                    SizedBox(
                      width: Get.width,
                      child: PaginatedDataTable(
                          showCheckboxColumn: true,
                          rowsPerPage: 10,
                          columns:const [
                            DataColumn(label: Text("Id")),
                            DataColumn(label: Text("Name")),
                            DataColumn(label: Text("Customer")),
                            DataColumn(label: Text("Date")),
                            DataColumn(label: Text("Phone")),
                            DataColumn(label: Text("#Items")),
                            DataColumn(label: Text("Total price")),
                            DataColumn(label: Text("Status")),
                            DataColumn(label: Text("")),
                          ],
                          source: ProductDatatableSource()),
                    ),
                  ],
                )
                
              )

            ],
          ),
        )
    );
  }
}

class ProductDatatableSource extends DataTableSource {
@override
DataRow? getRow(int index) {
return DataRow(cells: [
  DataCell(Text("0976")),
  DataCell(Text("Iphone 13"),),
  DataCell(Text("Amanuwl"),),
  DataCell(Text("12/3/2023"),),
  DataCell(Text("987545727"),),
  DataCell(Text("1"),),
  DataCell(Text("ETB 50000"),),
  DataCell(Text("Pending"),),
  DataCell(Row(
    children: [
      IconButton(onPressed:() {
      }, icon:const Icon(Icons.remove_red_eye)),
      IconButton(
          onPressed:() {
          }, icon:const Icon(Icons.delete_forever)),
    ],
  ))
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
