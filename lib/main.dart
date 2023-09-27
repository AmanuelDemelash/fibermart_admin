import 'package:fibermart_admin/screens/homepage/homepage.dart';
import 'package:fibermart_admin/screens/splash/splash.dart';
import 'package:fibermart_admin/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fibermart',
      theme: ThemeData(
        fontFamily: "myfont",
        primaryColor: Constants().primColor,
        useMaterial3: true,
      ),
      home: const Splash(),
      getPages: [
        GetPage(name: "/splash", page:() => Splash(),),
        GetPage(name: "/homepage", page:() => HomePage(),)
      ],
    );
  }
}
