
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
        color: Constants().scafoldColor,
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("FiberMart",style: TextStyle(fontWeight: FontWeight.bold,fontSize:30,color: Constants().primColor),),
            const SizedBox(width: 300,),
            SizedBox(
              width: 300,
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
                  fillColor: Constants().scafoldColor,
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
                const FaIcon(FontAwesomeIcons.bell),
                const SizedBox(width: 15,),
                CircleAvatar(
                  radius:30,
                  backgroundColor: Constants().backColor,
                )
              ],
            )
            )
          ],)
    );
  }
}
