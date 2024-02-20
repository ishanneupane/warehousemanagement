import 'package:flutter/material.dart';

import '../../../core/model/product_model.dart';
import 'arrival_inventory_sqlite.dart';

class ArrivalUi extends StatefulWidget {
  const ArrivalUi({Key? key}) : super(key: key);

  @override
  State<ArrivalUi> createState() => _ArrivalUiState();
}

class _ArrivalUiState extends State<ArrivalUi> {
  List<Map<String, dynamic>> journal = [];

  @override
  void initState() {
    refreshJournal();
    super.initState();
  }

  void refreshJournal() async {
    final data = await CurrentInventory.getProducts();
    setState(() {
      journal = data;
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
            "ARRIVED PRODUCTS",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: journal.length,
        itemBuilder: (context, index) => Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        journal[index]['productName'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text("Delivered Weight:\t" +
                              journal[index]['weight'].toString()),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .25,
                          ),
                          Text("Best Before:\t" +
                              journal[index]['bestBefore'].substring(0, 10)),
                        ],
                      ),
                      Text("Farmer's Name:\t" + journal[index]['name']),
                    ],
                  ),
                  IconButton(
                    onPressed: () => showForm(journal[index]['id']),
                    icon: Icon(
                      Icons.edit,
                      color: Colors.black54,
                    ),
                  ),
                  IconButton(
                    onPressed: () => deleteItem(journal[index]['id']),
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 15,
        ),
        onPressed: () => showForm(null),
      ),
    );
  }

  void showForm(int? id) async {
    if (id != null) {
      final existingJournal =
          journal.firstWhere((element) => element['id'] == id);
      farmerController.text = existingJournal['name'];
      productController.text = existingJournal['productName'];
      bestBeforeController.text =
          existingJournal['bestBefore'].substring(0, 10);
      weightController.text = existingJournal['weight'].toString();
    }
    showModalBottomSheet(
      backgroundColor: Colors.grey.shade200,
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
                icon: Icon(Icons.fastfood_rounded),
                hintText: 'Tomato',
                labelText: 'ProductName',
              ),
            ),
            TextFormField(
              controller: weightController,
              decoration: const InputDecoration(
                icon: Icon(Icons.line_weight_rounded),
                hintText: '88',
                labelText: 'Weight in kg',
              ),
            ),
            TextFormField(
              controller: bestBeforeController,
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range),
                hintText: '2000-12-12',
                labelText: 'Best Before Date',
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
  final TextEditingController bestBeforeController = TextEditingController();

  Future<void> addItem() async {
    String name = farmerController.text;
    String productName = productController.text;
    double weight = double.tryParse(weightController.text) ?? 0.0;
    DateTime? bestBefore;
    try {
      bestBefore = DateTime.parse(bestBeforeController.text);
    } catch (e) {
      print('Error parsing date: $e');
    }

    if (name.isNotEmpty &&
        productName.isNotEmpty &&
        weight > 0.0 &&
        bestBefore != null) {
      Product newProduct = Product(
        name: name,
        productName: productName,
        weight: weight,
        arrival: DateTime.now(),
        bestBefore: bestBefore,
      );

      await CurrentInventory.createProduct(newProduct);

      refreshJournal();
      Navigator.of(context).pop();
      farmerController.clear();
      productController.clear();
      weightController.clear();
      bestBeforeController.clear();
    } else {
      // Show error message to the user
      // You can use a SnackBar or any other way to display the error
    }
  }

  Future<void> updateItem(int id) async {
    String name = farmerController.text;
    String productName = productController.text;
    double weight = double.tryParse(weightController.text) ?? 0.0;
    DateTime? bestBefore;
    try {
      bestBefore = DateTime.parse(bestBeforeController.text);
    } catch (e) {
      print('Error parsing date: $e');
    }

    if (name.isNotEmpty &&
        productName.isNotEmpty &&
        weight > 0.0 &&
        bestBefore != null) {
      Product updatedProduct = Product(
        id: id.toString(),
        name: name,
        productName: productName,
        weight: weight,
        arrival: DateTime.now(),
        bestBefore: bestBefore,
      );

      await CurrentInventory.updateProduct(updatedProduct);

      refreshJournal();
      Navigator.of(context).pop();
      farmerController.clear();
      productController.clear();
      weightController.clear();
      bestBeforeController.clear();
    } else {
      // Show error message to the user
      // You can use a SnackBar or any other way to display the error
    }
  }

  Future<void> deleteItem(int id) async {
    await CurrentInventory.deleteProduct(id);
    refreshJournal();
  }
}
