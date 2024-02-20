import 'package:flutter/material.dart';

import '../inventory/sales/sales_db.dart';

class UnfulfilledOrder extends StatefulWidget {
  const UnfulfilledOrder({super.key});

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
    print("item count $journal.length");
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
            "Your Orders",
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
                      ],
                    ),
                  ),
                ],
              )),
    );
  }

  Future<void> deleteItem(int id) async {
    await Sales.deleteProduct(id);
    refreshJournal();
  }
}
