
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../controller/homepageController.dart';
import '../dashborad/widgets/carddashbord.dart';

class Orders extends StatelessWidget {
   Orders({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width,
        padding:const EdgeInsets.all(25),
    color: Constants().backColor,
    child:SingleChildScrollView(
      child: Column(
      children: [
        const ListTile(
          title: Text("Orders",style: TextStyle(fontSize: 25,),),
          subtitle:Text("your customer orders",style: TextStyle(color: Colors.black38),),
        ),
        const SizedBox(height: 25,),
        Row(
         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CardDashbord(title: "20",subtitle: "Pending Orders",color: Colors.green,icon: Icons.shopping_cart,),
            const SizedBox(width: 20,),
            CardDashbord(title: "1050",subtitle: "Completed Order",color: Colors.deepPurple,icon: Icons.check_circle),
            const SizedBox(width: 20,),
            CardDashbord(title: "10k",subtitle: "Canceled Order",color: Constants().primColor,icon: Icons.cancel),
            const SizedBox(width: 20,),
            CardDashbord(title: "123",subtitle: "Total order",color: Colors.orange,icon: Icons.add_shopping_cart,),
          ],
        ),
        const SizedBox(height: 25,),
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
                // tab
                SizedBox(
                    width: Get.width,
                    child: Obx(
                          () => Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        children: List.generate(3, (index) {
                          return
                                GestureDetector(
                                  onTap: () =>Get.find<HomepageController>().selectedIndex
                                      .value = index,
                                  child: AnimatedContainer(
                                    duration:
                                    const Duration(seconds: 1),
                                    margin:const EdgeInsets.only(right: 10),
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text( Get.find<HomepageController>().orderSelectionToggle[index],
                                            style: TextStyle(
                                              fontSize: Get.find<HomepageController>().selectedIndex
                                                .value ==
                                            index
                                            ? 17
                                              : 13,
                                              fontWeight: Get.find<HomepageController>().selectedIndex
                                                  .value ==
                                                  index
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                              color:
                                              Get.find<HomepageController>().selectedIndex
                                                  .value ==
                                                  index
                                                  ? Constants().primColor
                                                  : Colors.black54,
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            height:4,
                                            color:  Get.find<HomepageController>().selectedIndex
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
                const SizedBox(height:20,),
                DataTable(
                    headingTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Constants().primColor,fontSize: 16),
                    dataRowMaxHeight: 60,
                    columns:const[
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
                    rows:List.generate(10, (index) => DataRow(
                        cells:[
                          DataCell(Text("0976")),
                          DataCell(Text("Iphone 13"),),
                          DataCell(Text("Amanuwl"),),
                          DataCell(Text("12/3/2023"),),
                          DataCell(Text("987545727"),),
                          DataCell(Text("1"),),
                          DataCell(Text("ETB 50000"),),
                          DataCell(Container(
                            padding:const EdgeInsets.all(7),
                               decoration: BoxDecoration(
                                 color: Colors.orangeAccent.withOpacity(0.3)
                               ),
                              child:const Text("Pending",style: TextStyle(color: Colors.orangeAccent),)),),
                          DataCell(
                              Row(
                                children: [
                                  IconButton(onPressed:() {
                                  }, icon:const Icon(Icons.remove_red_eye)),
                                  IconButton(
                                      onPressed:() {
                                      }, icon:const Icon(Icons.delete_forever)),
                                ],
                              ))
                        ])))
              ],
            )

        )

      ]
        ,
      ),
    )).animate().slideX();
  }
}
