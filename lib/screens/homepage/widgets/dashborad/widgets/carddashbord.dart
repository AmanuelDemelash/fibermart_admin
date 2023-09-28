

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../../utils/constants.dart';

class CardDashbord extends StatelessWidget {
  String title;
  String subtitle;
  Color color;
  IconData icon;
   CardDashbord({super.key,required this.title,required this.subtitle,required this.color,required this.icon});

  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
      duration: const Duration(seconds: 100),
      width: 300,
      padding:const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Constants().scafoldColor
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding:const EdgeInsets.all(10),
            title:Text(title),
            subtitle:Text(subtitle),
            trailing: Container(
              padding:const EdgeInsets.all(10),
              decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  color:color
              ),
              child:Icon(icon,color: Colors.white,),
            ),
            titleTextStyle:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            subtitleTextStyle: const TextStyle(fontWeight:FontWeight.bold,fontSize: 15),
          ),
          Row(
            children: [
              Text("21%",style: TextStyle(color:color),),
              Icon(Icons.auto_graph,color:color,)
            ],
          )
        ].animate(interval: 300.ms).fade(duration: 200.ms),
      ),
    );
  }
}
