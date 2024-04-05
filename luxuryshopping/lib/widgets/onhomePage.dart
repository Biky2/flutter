import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxuryshopping/controller/homepage.dart';
import 'package:luxuryshopping/widgets/dropdown_btn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: <Widget>[],
    // );
    return GetBuilder<Homecontroller>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'add item',
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Add New product',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                      backgroundColor: Colors.lightGreen),
                ),
                TextField(
                  controller: ctrl.productnamectrl,
                  decoration: InputDecoration(
                    hintText: 'product name',
                    labelText: 'name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ctrl.productpricectrl,
                  decoration: InputDecoration(
                    hintText: 'price',
                    labelText: 'price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ctrl.descriptionctrl,
                  decoration: InputDecoration(
                    hintText: 'say about your product',
                    labelText: 'description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  maxLines: 4,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ctrl.productimagectrl,
                  decoration: InputDecoration(
                    hintText: 'people love to see it',
                    labelText: 'Image url',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Btn(
                      dropdownValue: 'category',
                      list: ['cate1', 'cate2', 'cate2'],
                      onselected: (data) {
                        ctrl.category = data;
                      },
                    )),
                    Expanded(
                        child: Btn(
                      dropdownValue: 'brand',
                      list: ['brand1', 'brand2', 'brand3'],
                      onselected: (data) {
                        ctrl.brand = data;
                      },
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text('beta lele'),
                SizedBox(
                  height: 20,
                ),
                Btn(
                  dropdownValue: 'offer?',
                  list: ['yes', 'no'],
                  onselected: (data) {
                    ctrl.offer = bool.tryParse(data ?? 'false') ?? false;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    //connected to  the databse and acces to storage
                    ctrl.addproduct();
                  },
                  child: Text(
                    'waiting for you',
                    style: TextStyle(
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),

                // DropdownButton(items: items, onChanged: onChanged)
              ],
            ),
          ),
        ),
      );
    });
  }
}
