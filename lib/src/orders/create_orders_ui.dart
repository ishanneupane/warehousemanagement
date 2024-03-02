import 'package:flutter/material.dart';
import 'model/order_model.dart';
import 'order_sql.dart';

class CreateOrder extends StatefulWidget {
  const CreateOrder({super.key});

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  List<Map<String, dynamic>> journal = [];

  void refreshJournal() async {
    final data = await Order.getProducts();
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
            "Your Orders",
            style: TextStyle(color: Colors.white),
          ))),
      body: journal.isNotEmpty
          ? ListView.builder(
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
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              journal[index]['productName'] ?? "",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text("Total Sales(KG):\t" +
                                    journal[index]['weight'].toString()),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () => showForm(journal[index]['id']),
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () => deleteItem(journal[index]['id']),
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Text(
                'No orders found.',
                style: TextStyle(fontSize: 20),
              ),
            ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 20,
          ),
          onPressed: () => showForm(null)),
    );
  }

  void showForm(int? id) async {
    if (id != null) {
      final existingJournal =
          journal.firstWhere((element) => element['id'] == id);
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
              child: Text(id == null ? 'Create Order' : "Update Order"),
            ),
          ],
        ),
      ),
    );
  }

  final TextEditingController productController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  Future<void> addItem() async {
    String productName = productController.text;
    double weight = double.parse(weightController.text);

    OrderModel newProduct = OrderModel(
      publishedDate: DateTime.now(),
      productName: productName,
      weight: weight,
    );

    // Add the new product to the database
    await Order.createProduct(newProduct);

    refreshJournal();
    Navigator.of(context).pop();
    productController.clear();
    weightController.clear();
  }

  Future<void> updateItem(int id) async {
    String productName = productController.text;
    double weight = double.parse(weightController.text);
    OrderModel updatedProduct = OrderModel(
      id: id,
      productName: productName,
      weight: weight,
      publishedDate: DateTime.now(),
    );

    await Order.updateProduct(updatedProduct);

    refreshJournal();
    Navigator.of(context).pop();
    productController.clear();
    weightController.clear();
  }

  Future<void> deleteItem(int id) async {
    await Order.deleteProduct(id);
    refreshJournal();
  }
}
