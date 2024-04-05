import 'package:clientside/controller/getcontrol.dart';
import 'package:clientside/controller/homepagecontroller.dart';
import 'package:clientside/homepage/homepage.dart';
import 'package:clientside/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class productDetail extends GetxController {
  TextEditingController description = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference ordercollection;
  String title = '', descr = '';
  double price = 0;
  @override
  void onInit() {
    ordercollection = firestore.collection('orders');
    super.onInit();
  }

  submitbtn({required double pr, required String tit, required String des}) {
    descr = description.text;
    price = pr;
    title = tit;
    orderSucess(tit);
  }

  void orderSucess(String? transctionid) async {
    User? loginuse = Get.find<Login>().loginuser;
    try {
      if (transctionid != null) {
        DocumentReference docref = await ordercollection.add({
          'costumer': loginuse?.name ?? '',
          'phone': loginuse?.number ?? '',
          'item': title,
          'price': productDetail,
          'address': descr,
          'transactionid': transctionid,
          'datetime': DateTime.now().toString(),
        });
        print('order successfully :${docref.id}');
        showordersuccessfull(docref.id);

        Get.snackbar('success', 'congo');
      } else {
        Get.snackbar('failed', 'so sad');
      }
    } catch (err) {
      print('failed:${err}');
    }
  }

  void showordersuccessfull(String orderid) {
    Get.defaultDialog(
      title: 'order success,context',
      content: Text('your order id${orderid}'),
      confirm: ElevatedButton(
        onPressed: () {
          Get.off(const HomePage());
        },
        child: const Text('close'),
      ),
    );
  }
}
