import 'package:clientside/additemonhomepade/firstuserpage.dart';
import 'package:clientside/controller/getcontrol.dart';
import 'package:clientside/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Login>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WELCOME BACK',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ctrl.loginname,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  prefixIcon: Icon(Icons.phone_android),
                  hintText: 'enter your number',
                  label: Text('number'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  ctrl.loginwithphone();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white),
                child: Text(
                  'log in',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Get.to(Registerpage());
                },
                child: Text('register as a new user'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
