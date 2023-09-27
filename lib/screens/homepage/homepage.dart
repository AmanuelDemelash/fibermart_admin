
import 'package:fibermart_admin/screens/homepage/controller/homepageController.dart';
import 'package:fibermart_admin/screens/homepage/widgets/dashborad/homeDashborad.dart';
import 'package:fibermart_admin/screens/homepage/widgets/navbar.dart';
import 'package:fibermart_admin/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  var pageController=PageController(initialPage: 0);
  var homepageCOntroller=Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              // nav bar
              NavBar(),
              Expanded(
                  child:
                  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(() =>
                      NavigationRail(
                        destinations:const[
                          NavigationRailDestination(icon:Icon(Icons.dashboard_customize_outlined), label:Text("Dashboard")),
                          NavigationRailDestination(icon:Icon(Icons.pages_rounded), label:Text("Product")),
                          NavigationRailDestination(icon:Icon(Icons.category), label:Text("Category")),
                          NavigationRailDestination(icon:Icon(Icons.add_shopping_cart), label:Text("Orders")),
                          NavigationRailDestination(icon:Icon(Icons.price_change), label:Text("Coupon")),
                          NavigationRailDestination(icon:Icon(Icons.settings), label:Text("Shop Setting")),
                        ],
                        selectedIndex:homepageCOntroller.intialPage.value,
                        extended: homepageCOntroller.isnavExpanded.value,
                        //useIndicator: false,
                        indicatorColor: Constants().primColor,
                        selectedIconTheme: IconThemeData(color: Constants().backColor,),
                        selectedLabelTextStyle: TextStyle(color: Constants().primColor,fontWeight: FontWeight.bold),
                        backgroundColor: Constants().scafoldColor,
                        onDestinationSelected: (value) {
                          homepageCOntroller.intialPage.value=value;
                          pageController.jumpToPage(value);
                        },
                      ),),
                  Expanded(
                    child:
                      PageView(
                        physics:const NeverScrollableScrollPhysics(),
                        controller: pageController,
                        children: [
                          //dashbord
                          HomeDashborad(),
                          Container(
                            color: Constants().backColor,
                            child: Text("page two"),
                          ),

                        ],
                      ),

                  )
                ],
              ))
              
            ],
          )
      ),
    );
  }
}
