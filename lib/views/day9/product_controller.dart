import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:testappbc/views/day9/product_service.dart';

import 'productmodel.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;

  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    var products = await RemoteServices.fetchProduct();
    if (products != null) {
      productList.value = products;
    }
  }
}
