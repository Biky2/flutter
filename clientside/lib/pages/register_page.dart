import 'package:clientside/controller/getcontrol.dart';
import 'package:clientside/pages/loginPage.dart';
import 'package:clientside/widget/otp_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Registerpage extends StatelessWidget {
  const Registerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Login>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white54),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'create your account !!!',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ctrl.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'enter your name',
                  labelText: 'NAME',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ctrl.number,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'enter your number',
                  labelText: 'number',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              OtpText(
                otpcontroller: ctrl.otpFieldController,
                visible: ctrl.otpfield,
                onchnage: (otp) {
                  ctrl.otpenter = int.tryParse(otp ?? '0000');
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (ctrl.otpfield) {
                    ctrl.adduser();
                  } else {
                    ctrl.sendotp();
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white),
                child: Text(
                  ctrl.otpfield ? 'send otp' : 'register',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Get.to(Loginpage());
                },
                child: Text(
                  'log in',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
