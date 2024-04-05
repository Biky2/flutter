import 'package:clientside/additemonhomepade/firstuserpage.dart';
import 'package:clientside/additemonhomepade/product_details.dart';
import 'package:clientside/controller/homepagecontroller.dart';
import 'package:clientside/pages/loginPage.dart';
import 'package:clientside/widget/dropdown_btn.dart';
import 'package:clientside/widget/selectedbtn.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homepagecontroller>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async {
          ctrl.fetchdata();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Homepage',
              // textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    GetStorage box = GetStorage();
                    box.erase();
                    Get.offAll(() => Loginpage());
                  },
                  icon: Icon(Icons.logo_dev))
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ctrl.catego.length,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () {
                          ctrl.filterBycategory(
                              ctrl.catego[index].categoryname ?? '');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Chip(
                            label: Text('${ctrl.catego[index].categoryname}' ??
                                'no category'),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Flexible(
                    child: Btn(
                        dropdownValue: 'selected',
                        list: ['high to low', 'low to high'],
                        onselected: (x) {
                          ctrl.sortbyprice(x == 'high to low' ? false : true);
                        }),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                      child: Selectedbtn(
                    items: ['1', '2', '3'],
                    onchanged: (selecteditems) {
                      ctrl.filterbybrand(selecteditems);
                    },
                  )),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: ctrl.products.length,
                  itemBuilder: (ctx, index) {
                    return Pickcard(
                      imgurl:
                          //     'https://pbs.twimg.com/profile_images/572395168905457664/lCtqj0ak_400x400.jpeg',
                          ctrl.productshowInui[index].image ?? 'no image',
                      name: ctrl.productshowInui[index].name ?? 'no name',
                      offertag: '56',
                      price: ctrl.productshowInui[index].price ?? 00,
                      press: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => ProductDetails()),
                        // );
                        Get.to(ProductDetails(),
                            arguments: {'data': ctrl.productshowInui[index]});
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
