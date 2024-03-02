import 'package:flutter/material.dart';
import '../model/order_model.dart';
import '../order_sql.dart';

class UnfulfilledState extends ChangeNotifier {
  List<OrderModel> dispatchRequests = [];

  Future<void> getTask() async {
    List<Map<String, dynamic>> productsData = await Order.getProducts();
    dispatchRequests =
        productsData.map((data) => OrderModel.fromJson(data)).toList();
    print(dispatchRequests);
    notifyListeners();
  }
}
