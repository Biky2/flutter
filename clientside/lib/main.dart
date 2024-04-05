import 'package:clientside/controller/firebasecontrol.dart';
import 'package:clientside/controller/getcontrol.dart';
import 'package:clientside/controller/homepagecontroller.dart';
import 'package:clientside/controller/productDe.dart';
import 'package:clientside/homepage/homepage.dart';
import 'package:clientside/pages/loginPage.dart';
import 'package:clientside/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  Get.put(Login());
  Get.put(Homepagecontroller());
  Get.put(productDetail());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'myapp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Loginpage(),
    );
  }
}
