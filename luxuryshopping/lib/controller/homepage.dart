import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxuryshopping/models/products.dart';

class Homecontroller extends GetxController {
  //access the firebase database
  FirebaseFirestore firebasStore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productnamectrl = TextEditingController();
  TextEditingController descriptionctrl = TextEditingController();
  TextEditingController productpricectrl = TextEditingController();
  TextEditingController productimagectrl = TextEditingController();

  String brand = '';
  String category = '';
  bool offer = false;
  List<Product> products = [];
  @override
  void onInit() async {
    productCollection = firebasStore.collection(
        'product'); //access the product in the datebase ans store all on that
    await fetchdata();
    super.onInit();
  }

  addproduct() async {
    try {
      DocumentReference docRef = productCollection.doc();
      Product product = Product(
          brand: category,
          category: category,
          description: descriptionctrl.text,
          id: docRef.id,
          image: productimagectrl.text,
          name: productnamectrl.text,
          offer: offer,
          price: double.tryParse(productpricectrl.text));
      final productdetails = product.toJson(); //convert in json form
      await docRef.set(productdetails); //set in database
      Get.snackbar("success", "product added succesfully",
          colorText: Colors.greenAccent);
      sevaluedefault();
    } catch (e) {
      Get.snackbar("failed", e.toString(), colorText: Colors.greenAccent);
    }
  }

  sevaluedefault() {
    productnamectrl.clear();
    descriptionctrl.clear();

    productpricectrl.clear();
    productimagectrl.clear();

    brand = 'general';
    category = 'uncategories';
    offer = false;
    update(); //forcefully update
  }

  fetchdata() async {
    QuerySnapshot productss = await productCollection.get();
    final List<Product> retrivedproduct = productss.docs
        .map((e) => Product.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    products.clear();
    products.assignAll(retrivedproduct);
    update();
  }

  deleteonpress(String id) async {
    await productCollection.doc(id).delete();
    fetchdata();
  }
}
