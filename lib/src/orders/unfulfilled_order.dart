import 'package:flutter/material.dart';
import 'package:warehousemanagement/src/orders/order_sql.dart';

import '../inventory/sales/sales_db.dart';

class UnfulfilledOrder extends StatefulWidget {
  const UnfulfilledOrder({Key? key}) : super(key: key);

  @override
  State<UnfulfilledOrder> createState() => _UnfulfilledOrderState();
}

class _UnfulfilledOrderState extends State<UnfulfilledOrder> {
  List<Map<String, dynamic>> journal = [];

  void refreshJournal() async {
    final data = await Sales.getProducts();
    setState(() {
      journal = data;
    });
  }

  @override
  void initState() {
    refreshJournal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade800,
        title: Center(
          child: Text(
            "Orders Received",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: journal.length,
        itemBuilder: (context, index) => Column(
          children: [
            SizedBox(height: 5),
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
                      Checkbox(
                        checkColor: Colors.green,
                        fillColor: MaterialStateProperty.all(Colors.white),
                        value: journal[index]['isComplete'] ?? false,
                        onChanged: (bool? value) {
                          setState(() {
                            journal[index]['isComplete'] = value ?? false;
                          });
                        },
                      ),
                      Text(
                        journal[index]['productName'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Posted Date:\t" +
                                  journal[index]['publishedDate'],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Total Sales(KG):\t" +
                                  journal[index]['weight'].toString(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade100,
        onPressed: () async {
          // Get the list of checked tasks
          List<Map<String, dynamic>> checkedTasks =
              journal.where((task) => task['isComplete']).toList();

          // Delete checked tasks
          for (Map<String, dynamic> checkedTask in checkedTasks) {
            await Order.deleteProduct(checkedTask['id']);
          }
          refreshJournal();
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
