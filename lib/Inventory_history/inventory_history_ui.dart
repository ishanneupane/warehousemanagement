import 'package:flutter/material.dart';
import 'package:warehousemanagement/Inventory_history/history_api.dart';
import 'package:warehousemanagement/Inventory_history/sql_history_of_products.dart';

class InventoryHistoryUi extends StatefulWidget {
  const InventoryHistoryUi({super.key});

  @override
  State<InventoryHistoryUi> createState() => _InventoryHistoryUiState();
}

List<Map<String, dynamic>> productList = [];

class _InventoryHistoryUiState extends State<InventoryHistoryUi> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    HistoryOfProductApiData().storeProductsToDatabase();

    final data = await HistoryOfInventoryOfProducts.getProducts();
    print(data);
    setState(() {
      productList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("Inventory History"),
        ),
        body: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) => ListTile(
            subtitle: Text("farmers name=" + productList[index]['name']),
            title: Text(productList[index]['productName']),
            leading: Text(productList[index]['arrival']),
            trailing: Text(productList[index]['weight']),
          ),
        ));
  }
}
