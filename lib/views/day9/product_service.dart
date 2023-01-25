import 'package:http/http.dart' as http;
import 'package:testappbc/views/day9/productmodel.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>?> fetchProduct() async {
    http.Response response;
    response = await client.get(Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"));
    if (response.statusCode == 200) {
      var jsonnString = response.body;
      return productFromJson(jsonnString);
    } else {
      return null;
    }
  }
}
