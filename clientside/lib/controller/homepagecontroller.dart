import 'package:clientside/models/productCategory.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:clientside/models/products.dart';

class Homepagecontroller extends GetxController {
  FirebaseFirestore firebasStore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  late CollectionReference categoryCollection;
  List<Product> products = [];
  List<Product> productshowInui = [];
  List<Productcategory> catego = [];
  @override
  void onInit() async {
    productCollection = firebasStore.collection(
        'product'); //access the product in the datebase ans store all on that
    categoryCollection = firebasStore.collection('category');
    await fetchdata();
    super.onInit();
  }

  fetchdata() async {
    QuerySnapshot productss = await productCollection.get();
    final List<Product> retrivedproduct = productss.docs
        .map((e) => Product.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    products.clear();
    products.assignAll(retrivedproduct);
    productshowInui.assignAll(products);
    update();
  }

  fetchcategorydata() async {
    QuerySnapshot categ = await categoryCollection.get();
    final List<Productcategory> retrivedproduct = categ.docs
        .map((e) => Productcategory.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    catego.clear();
    catego.assignAll(retrivedproduct);
    update();
  }

  filterBycategory(String category) {
    productshowInui.clear();
    productshowInui =
        products.where((element) => element.category == category).toList();
    update();
  }

  filterbybrand(List<String> brands) {
    if (brands.isEmpty) {
      productshowInui = products;
    } else {
      List<String> lowerbrandname = brands.map((e) => e.toLowerCase()).toList();
      productshowInui = products
          .where((element) => lowerbrandname.contains(element.brand ?? ''))
          .toList();
    }
    update();
  }

  sortbyprice(bool ascending) {
    List<Product> sorted = List<Product>.from(productshowInui);
    sorted.sort((a, b) => ascending
        ? a.price!.compareTo(b.price!)
        : b.price!.compareTo(a.price!));
    productshowInui = sorted;
    update();
  }
}
