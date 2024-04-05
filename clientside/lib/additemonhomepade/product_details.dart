import 'package:clientside/controller/productDe.dart';
import 'package:clientside/models/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clientside/homepage/homepage.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Product value = Get.arguments['data'];
    // print(value);
    return GetBuilder<productDetail>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text('product details'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  // 'https://pbs.twimg.com/profile_images/572395168905457664/lCtqj0ak_400x400.jpeg',
                  value.image ?? '',
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                value.name ?? '',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                value.description ?? '',
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'rs ${value.price ?? ''}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: ctrl.description,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'Description',
                  hintText: 'write your thoughts',
                ),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      ctrl.submitbtn(
                          pr: value.price ?? 0,
                          tit: value.name ?? '',
                          des: ctrl.description.text ?? '');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      'buy now',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      );
    });
  }
}
