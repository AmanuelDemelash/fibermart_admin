
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding:const EdgeInsets.only(left: 15,right: 15,top: 10),
        width: Get.width,
        height:80,
        color: Constants().primColor,
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Image(image: AssetImage("assets/images/logo.png",),width:60,height:60,fit: BoxFit.cover,),
            const Text("FiberMart",style: TextStyle(fontWeight: FontWeight.bold,fontSize:30,color: Colors.white),),
            const SizedBox(width:200,),
            SizedBox(
              width:500,
              height: 80,
              child:
              TextField(
                maxLines: 1,
                cursorColor: Constants().primColor,
                style:const TextStyle(
                    fontSize: 14
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Constants().backColor,
                  suffixIcon:const Icon(Icons.search,color: Colors.black45,),
                  enabledBorder: OutlineInputBorder(
                      borderRadius:const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Constants().backColor,width: 1)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Constants().backColor,width: 1)
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius:const BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Constants().backColor,width: 1)
                  ),
                  hintText: "search",
                ),
              ),
            ),
            Expanded(child:
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const FaIcon(FontAwesomeIcons.bell,color: Colors.white,),
                const SizedBox(width: 15,),
                PopupMenuButton<String>(itemBuilder:(context) => [
                  PopupMenuItem(child: const Text("Myaccount"),onTap: () {
                  },),
                  PopupMenuItem(child:const Row(
                    children: [
                      Icon(Icons.logout,color: Colors.red,),
                      Text("Log out"),
                    ],
                  ),onTap: () {

                  },),
                ],
                  color: Colors.white,


                )
              ],
            )
            )
          ],)
    );
  }
}
