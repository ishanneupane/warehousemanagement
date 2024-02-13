import 'package:flutter/material.dart';
import 'package:warehousemanagement/inventory/current_inventory_sqlite.dart';

import '../Inventory_history/model/product_model.dart';

class InventoryCrudAndUi extends StatefulWidget {
  const InventoryCrudAndUi({super.key});

  @override
  State<InventoryCrudAndUi> createState() => _InventoryCrudAndUiState();
}

class _InventoryCrudAndUiState extends State<InventoryCrudAndUi> {
  List<Map<String, dynamic>> journal = [];

  void refreshJournal() async {
    final data = await CurrentInventory.getProducts();
    setState(() {
      journal = data;
    });
  } //item display garna

  @override
  void initState() {
    refreshJournal();
    print("item count $journal.length");
    super.initState();
  } // yeta bata display hunxa

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Center(child: Text("OUR INVENTORY"))),
      body: ListView.builder(
          itemCount: journal.length,
          itemBuilder: (context, index) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(journal[index]['name']),
                      Text(journal[index]['productName']),
                      IconButton(
                          onPressed: () => showForm(journal[index]['id']),
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () => deleteItem(journal[index]['id']),
                          icon: Icon(Icons.delete)),
                    ],
                  )
                ],
              )),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 15,
          ),
          onPressed: () => showForm(null)),
    );
  }

  void showForm(int? id) async {
    if (id != null) {
      final existingJournal =
          journal.firstWhere((element) => element['id'] == id);
      farmerController.text = existingJournal['name'];
      productController.text = existingJournal['productName'];
    }
    showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        child: Column(
          children: [
            Center(
              child: Text(
                "PRODUCT DETAILS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            TextFormField(
              controller: farmerController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Ramesh',
                labelText: "Farmer's Name",
              ),
            ),
            TextFormField(
              controller: productController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Tomato',
                labelText: 'ProductName',
              ),
            ),
            TextFormField(
              controller: weightController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: '88',
                labelText: 'Weight in kg',
              ),
            ),
            TextFormField(
              controller: arrivalController,
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range),
                hintText: '2000/22/22',
                labelText: 'Arrival Date',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                print(id);

                if (id == null) {
                  await addItem();
                } else {
                  await updateItem(id);
                }
              },
              child: Text(id == null ? 'Add Item' : "Update"),
            ),
          ],
        ),
      ),
    );
  }

  final TextEditingController farmerController = TextEditingController();
  final TextEditingController productController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController arrivalController = TextEditingController();
  final TextEditingController bestBeforeController = TextEditingController();

  Future<void> addItem() async {
    // Get the data from text field controllers
    String name = farmerController.text;
    String productName = productController.text;
    double weight = double.parse(weightController.text);
    DateTime arrival = DateTime.parse(arrivalController.text);

    // Create a new Product object
    Product newProduct = Product(
      name: name,
      productName: productName,
      weight: weight,
      arrival: arrival,
      bestBefore: DateTime
          .now(), // You might want to provide this value based on user input
    );

    // Add the new product to the database
    await CurrentInventory.createProduct(newProduct);

    refreshJournal();
    Navigator.of(context).pop();
    farmerController.clear();
    productController.clear();
    weightController.clear();
    arrivalController.clear();
  }

  Future<void> updateItem(int id) async {
    String name = farmerController.text;
    String productName = productController.text;
    double weight = double.parse(weightController.text);
    DateTime arrival = DateTime.parse(arrivalController.text);

    Product updatedProduct = Product(
      id: id.toString(),
      name: name,
      productName: productName,
      weight: weight,
      arrival: arrival,
      bestBefore: DateTime
          .now(), // You might want to provide this value based on user input
    );

    await CurrentInventory.updateProduct(updatedProduct);

    refreshJournal();
    Navigator.of(context).pop();
    farmerController.clear();
    productController.clear();
    weightController.clear();
    arrivalController.clear();
  }

  Future<void> deleteItem(int id) async {
    await CurrentInventory.deleteProduct(id);
    refreshJournal();
  }
}
