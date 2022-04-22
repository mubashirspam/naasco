
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naasco_mart/controller/auth_controller.dart';
import 'package:naasco_mart/view/screens/home_screen.dart';
import 'package:naasco_mart/view/screens/welcom_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(
    (value) => Get.put(
      AuthController(),
    ),
  );

  // await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    final ThemeData theme = ThemeData();
    return GetMaterialApp(
      title: 'Naaso',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Outfit',
          scaffoldBackgroundColor: Color(0xffF6F7F8),
          colorScheme: theme.colorScheme.copyWith(
            secondary: Color(0xfff1908c),
            // primary: Color(0xff77b86c),
            onPrimary: Color(0xff506eda),
          )),
      home: WelcomScreen()
     
    );
  }
}
