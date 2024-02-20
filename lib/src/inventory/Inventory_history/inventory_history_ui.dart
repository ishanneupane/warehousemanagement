import 'package:flutter/material.dart';
import 'package:warehousemanagement/src/inventory/Inventory_history/sql_history_of_products.dart';
import 'history_api.dart';

class InventoryHistoryUi extends StatefulWidget {
  const InventoryHistoryUi({Key? key});

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
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(
          child: Text(
            "Inventory History",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: (productList.length / 2).ceil(),
        itemBuilder: (context, index) {
          final int firstIndex = index * 2;
          final int secondIndex = firstIndex + 1;
          return Row(
            children: [
              if (firstIndex < productList.length)
                _buildProductItem(context, firstIndex),
              SizedBox(width: 10), // Add space between items
              if (secondIndex < productList.length)
                _buildProductItem(context, secondIndex),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width * .25,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.green.shade700, Colors.green],
            begin: Alignment.topRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Farmer's Name: " + productList[index]['name'],
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 5),
            Text("Product Name: " + productList[index]['productName']),
            Text("Weight: " + productList[index]['weight'].toString() + "kg"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Arrival: " +
                    productList[index]['arrival'].substring(0, 10)),
                Text("Best Before: " +
                    productList[index]['bestBefore'].substring(0, 10)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
