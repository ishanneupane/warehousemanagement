import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:warehousemanagement/src/inventory/Inventory_history/sql_history_of_products.dart';

import '../../../core/model/product_model.dart';

class HistoryOfProductApiData {
  final String apiUrl =
      "https://ishanneupane.github.io/farmerdata/Untitled-1.json";

  Future<void> storeProductsToDatabase() async {
    final products = await fetchProductsFromApi();
    for (final product in products) {
      await HistoryOfInventoryOfProducts.createProduct(product);
    }
  }

  Future<List<OrderModel>> fetchProductsFromApi() async {
    final uri = Uri.parse(apiUrl);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    return (json as List<dynamic>)
        .map((productJson) => OrderModel.fromJson(productJson))
        .toList();
  }
}
