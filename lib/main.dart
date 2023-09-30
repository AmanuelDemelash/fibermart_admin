import 'package:fibermart_admin/api/user_sheet.dart';
import 'package:fibermart_admin/bindings/appBinding.dart';
import 'package:fibermart_admin/screens/homepage/homepage.dart';
import 'package:fibermart_admin/screens/splash/splash.dart';
import 'package:fibermart_admin/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()async{
 WidgetsFlutterBinding.ensureInitialized();
  await UserSheet.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Fibermart',
      theme: ThemeData(
        fontFamily: "myfont",
        primaryColor: Constants().primColor,
        useMaterial3: true,
        dataTableTheme: DataTableThemeData(dividerThickness:0.5,
          dataRowColor: MaterialStateColor.resolveWith((states) =>Constants().scafoldColor),
          headingRowColor: MaterialStateColor.resolveWith((states) => Constants().backColor)
        )
      ),
      home: const Splash(),
      getPages: [
        GetPage(name: "/splash", page:() => Splash(),),
        GetPage(name: "/homepage", page:() => HomePage(),)
      ],
    );
  }
}
