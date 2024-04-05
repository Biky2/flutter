import 'dart:math';
import 'package:clientside/additemonhomepade/firstuserpage.dart';
import 'package:clientside/homepage/homepage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:clientside/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class Login extends GetxController {
  GetStorage box = GetStorage();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController name = TextEditingController();
  TextEditingController loginname = TextEditingController();
  TextEditingController number = TextEditingController();
  OtpFieldControllerV2 otpFieldController = OtpFieldControllerV2();
  bool otpfield = false;
  int? otpgenerated;
  int? otpenter;
  late CollectionReference userController;
  User? loginuser;
  @override
  //after loaded screen it run
  void onReady() {
    Map<String, dynamic>? user = box.read('log in');
    if (user != null) {
      loginuser = User.fromJson(user);
      Get.to(HomePage());
    }

    super.onReady();
  }

  @override
  //before loading screen
  void onInit() {
    userController = firestore.collection('user');
    // clearscreen();
    // update();
    super.onInit();
  }

  adduser() async {
    try {
      if (name.text.isEmpty || number.text.isEmpty) {
        Get.snackbar("error", "ucheck", colorText: Colors.red);
        return;
      }
      if (otpgenerated == otpenter) {
        DocumentReference docRef = userController.doc();
        User user = User(
            name: name.text, id: docRef.id, number: int.tryParse(number.text));
        final userdetails = user.toJson(); //convert in json form
        await docRef.set(userdetails); //set in database
        Get.snackbar("success", "user added succesfully",
            colorText: Colors.greenAccent);
        name.clear();
        number.clear();
        otpFieldController.clear();
        // box.write('login', value);
      } else {
        Get.snackbar("otp not send", e.toString(), colorText: Colors.red);
      }
    } catch (e) {
      Get.snackbar("failed", e.toString(), colorText: Colors.red);
    }
  }

  sendotp() {
    if (name.text.isEmpty || number.text.isEmpty) {
      Get.snackbar("error", "ucheck", colorText: Colors.red);
      return;
    }
    final random = Random();
    int otp = 1000 + random.nextInt(9000);
    if (otp != null) {
      print(otp);
      otpfield = true;
      otpgenerated = otp;
      Get.snackbar("success", "otp sended", colorText: Colors.greenAccent);
    } else {
      Get.snackbar("failed", e.toString(), colorText: Colors.red);
    }
    update();
  }

  // clearscreen() {
  //   name.clear();
  //   number.clear();
  //   otpfield = false;
  //   update();
  // }
  loginwithphone() async {
    try {
      String phone = loginname.text;
      if (phone.isNotEmpty) {
        var query = await userController
            .where('number', isEqualTo: int.tryParse(phone))
            .limit(1)
            .get();
        if (query.docs.isNotEmpty) {
          var userdoc = query.docs.first;
          var userdata = userdoc.data() as Map<String, dynamic>;
          Get.snackbar("success", "log in succesfully",
              colorText: Colors.greenAccent);
          box.write('log in', userdata);
          loginname.clear();
          Get.to(HomePage());

          ///get storage
        } else {
          Get.snackbar("log in failed", e.toString(), colorText: Colors.red);
        }
      } else {
        Get.snackbar("not register", e.toString(), colorText: Colors.red);
      }
    } catch (error) {
      Get.snackbar("log in failed", e.toString(), colorText: Colors.red);
    }
  }
}
