import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luxuryshopping/controller/homepage.dart';
import 'package:luxuryshopping/firebase_confi/firebaseoptions.dart';
import 'package:luxuryshopping/widgets/onhomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  Get.put(Homecontroller()); //use homecontrller
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'luxurious',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homecontroller>(builder: (ctrl) {
      // String textToShow = ctrl.someVariable?.toString() ?? 'Default Value';
      return Scaffold(
        appBar: AppBar(
          leading: Image.asset('assests/background.png'),
          title: const Text('make your day'),
          // actions: const <Widget>[
          //   Expanded(
          //     child: Row(
          //       children: [
          //         TextField(
          //           decoration: InputDecoration(
          //             border: OutlineInputBorder(
          //               borderRadius: BorderRadius.all(Radius.circular(8)),
          //             ),
          //             labelText: 'search an item',
          //             hintText: 'oops we found your item just type here',
          //           ),
          //         )
          //       ],
          //     ),
          //   )
          // ],
        ),
        body: ListView.builder(
          itemCount: ctrl.products.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(ctrl.products[index].name ?? 'no name'),
              subtitle: Text((ctrl.products[index].price ?? 0).toString()),
              trailing: IconButton(
                  onPressed: () {
                    //used here
                    // ctrl.test();
                    ctrl.deleteonpress(ctrl.products[index].id ?? 'no data');
                  },
                  icon: const Icon(Icons.delete)),
            );
          },
        ),
        // body: ListView.builder(
        //   padding: const EdgeInsets.all(10),
        //   itemBuilder: (ctx, index) {
        //     // return Container(
        //     //   height: 10,
        //     //   child:
        //     return const Center(
        //       child: Text(
        //         'text',
        //         // style: TextStyle(fontWeight: FontWeight.bold),
        //       ),
        //     );
        //   },
        // ),
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            Get.to(HomePage()); //use instead of navigator
          },
          backgroundColor: Theme.of(context).colorScheme.onSecondary,
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
