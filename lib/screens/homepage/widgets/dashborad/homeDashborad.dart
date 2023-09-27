
import 'package:fibermart_admin/screens/homepage/widgets/dashborad/widgets/carddashbord.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';

class HomeDashborad extends StatelessWidget {
  const HomeDashborad({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: Get.width,
        padding:const EdgeInsets.all(25),
        color: Constants().backColor,
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
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardDashbord(title: "400",subtitle: "Order received",color: Colors.green,icon: Icons.shopping_cart,),
                CardDashbord(title: "1050",subtitle: "Total sale",color: Colors.deepPurple,icon: Icons.monetization_on_rounded),
                CardDashbord(title: "10k",subtitle: "Total customer",color: Constants().primColor,icon: Icons.people),
                CardDashbord(title: "123",subtitle: "Pending order",color: Colors.orange,icon: Icons.add_shopping_cart,),
                CardDashbord(title: "60",subtitle: "Completed order",color: Colors.lightGreenAccent,icon: Icons.check_circle,)
              ],
            ),
           const SizedBox(height: 20,),

          ],
        )
    );
  }
}
