import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testappbc/views/day9/product_controller.dart';
import 'package:testappbc/views/day9/product_tile.dart';

class ShopX extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  ShopX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: const Icon(Icons.arrow_back),
          actions: const [Icon(Icons.shop_2)],
        ),
        body: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "ShopX",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      showMessage(context, "This is a sample message.");
                    },
                    icon: const Icon(Icons.view_list_rounded)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.grid_view))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Obx((() => Expanded(
                  child: GridView.builder(
                      itemCount: productController.productList.length,
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) => ProductBox(
                            product: productController.productList[index],
                          )),
                )))
          ],
        ),
      ),
    );
  }
}

void showMessage(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Message'),
        content: Text(message),
        actions: <Widget>[
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
