import 'package:flutter/material.dart';
import 'package:warehousemanagement/inventory/sales/model/sold.dart';
import 'package:warehousemanagement/inventory/sales/sales_db.dart';

class SalesUi extends StatefulWidget {
  const SalesUi({super.key});

  @override
  State<SalesUi> createState() => _SalesUiState();
}

class _SalesUiState extends State<SalesUi> {
  List<Map<String, dynamic>> journal = [];

  void refreshJournal() async {
    final data = await SalesInventory.getProducts();
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
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
          backgroundColor: Colors.grey.shade800,
          title: Center(
              child: Text(
            "SOLD PRODUCTS",
            style: TextStyle(color: Colors.white),
          ))),
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
                        color: Colors.green.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                Text("Farmer's Name:\t" +
                                    journal[index]['name']),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .25,
                                ),
                                Text("Total Sales(KG):\t" +
                                    journal[index]['weight'].toString()),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () => showForm(journal[index]['id']),
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () => deleteItem(journal[index]['id']),
                            icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
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
      weightController.text = existingJournal['weight'].toString();
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
  // final TextEditingController bestBeforeController = TextEditingController();

  Future<void> addItem() async {
    String name = farmerController.text;
    String productName = productController.text;
    double weight = double.parse(weightController.text);
    // DateTime bestBefore = DateTime.parse(bestBeforeController.text);

    Sold newProduct = Sold(
      name: name,
      productName: productName,
      weight: weight,
    );

    // Add the new product to the database
    await SalesInventory.createProduct(newProduct);

    refreshJournal();
    Navigator.of(context).pop();
    farmerController.clear();
    productController.clear();
    weightController.clear();
    // bestBeforeController.clear();
  }

  Future<void> updateItem(int id) async {
    String name = farmerController.text;
    String productName = productController.text;
    double weight = double.parse(weightController.text);
    // DateTime bestBefore = DateTime.parse(bestBeforeController.text);
    //
    Sold updatedProduct = Sold(
      id: id.toString(),
      name: name,
      productName: productName,
      weight: weight,
      // arrival: DateTime.now(),
      // bestBefore: bestBefore,
      // You might want to provide this value based on user input
    );

    await SalesInventory.updateProduct(updatedProduct);

    refreshJournal();
    Navigator.of(context).pop();
    farmerController.clear();
    productController.clear();
    weightController.clear();
    // bestBeforeController.clear();
  }

  Future<void> deleteItem(int id) async {
    await SalesInventory.deleteProduct(id);
    refreshJournal();
  }
}
