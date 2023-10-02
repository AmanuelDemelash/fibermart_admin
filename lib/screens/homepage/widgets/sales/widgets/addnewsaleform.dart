
import 'package:fibermart_admin/models/sales.dart';
import 'package:fibermart_admin/screens/homepage/widgets/sales/controller/salescontroller.dart';
import 'package:fibermart_admin/utils/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants.dart';

class AddNewSaleForm extends StatelessWidget {
   AddNewSaleForm({super.key});

  final TextEditingController _idController=TextEditingController();
  final TextEditingController _nameController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width/2,
      color: Colors.white,
      height:400,
      padding:const EdgeInsets.all(40),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Id: "),
              const SizedBox(width: 60,),
              Expanded(child: TextField(
                controller: _idController,
                keyboardType: TextInputType.text,
                maxLines: 1,
                cursorColor: Constants().primColor,
                style:const TextStyle(
                    fontSize: 14
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Constants().backColor,
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
                  hintText: "Id",
                ),
              ),)
            ],
          ),
          const SizedBox(height:20),
          Row(
            children: [
              const Text("Name: "),
              const SizedBox(width:40,),
              Expanded(child: TextField(
                controller: _nameController,
                maxLines: 1,
                cursorColor: Constants().primColor,
                keyboardType: TextInputType.text,
                style:const TextStyle(
                    fontSize: 14
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Constants().backColor,
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
                  hintText: "Name",
                ),
              ),)
            ],
          ),
          const SizedBox(height:40,),
          Obx(() =>Get.find<SalesController>().isAddNewSales.value?
          const Loading():const SizedBox(),),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Constants().backColor,
                    padding:const EdgeInsets.all(20)
                  ),
                    onPressed:() {
                  Get.back();
                }, child:const Text("Cancel")),
              ),
              const SizedBox(width: 30,),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                      backgroundColor: Constants().primColor,
                      padding:const EdgeInsets.all(20)
                  ),
                    onPressed:()async{
                    if(_idController.text.isEmpty || _nameController.text.isEmpty){
                      Get.snackbar("empty field", "please fill required filed",
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          padding:const EdgeInsets.all(10),
                         margin:const EdgeInsets.only(right: 100,top: 20,left: 20),
                      );
                    }
                    else{
                      SalesTeam sales=SalesTeam(name: _nameController.text, id:_idController.text);
                      Get.find<SalesController>().addSales(sales);
                    }

                }, child:const Text("Add",style: TextStyle(color: Colors.white),)),
              ),
            ],
          )

        ],
      ),
    );
  }
}
